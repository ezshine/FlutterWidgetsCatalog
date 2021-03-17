import 'package:flutter/material.dart';

class EZMindMap extends StatefulWidget {
  EZMindMap({Key key}) : super(key: key);

  final List<Map> _allNodes = [];

  Map addNode(String text, [Map parentNode]) {
    Map node = {"text": text, "children": []};

    if (parentNode == null)
      _allNodes.add(node);
    else
      parentNode["children"].add(node);

    return node;
  }

  @override
  _EZMindMapState createState() => _EZMindMapState();
}

class _EZMindMapState extends State<EZMindMap> {

  Offset drawStartPoint = Offset(0,0);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: GestureDetector(
        onPanUpdate: (DragUpdateDetails detail){
          drawStartPoint = Offset(drawStartPoint.dx + detail.delta.dx,drawStartPoint.dy + detail.delta.dy);
          setState(() {
            
          });
        },
        child: CustomPaint(
          painter: _EZMindMapPainter(widget._allNodes,drawStartPoint),
        )
      )
    );
  }
}

class _EZMindMapPainter extends CustomPainter {
  List<Map> allNodes;

  Offset startPoint;

  _EZMindMapPainter(List<Map> allNodes,[Offset startPoint]) {
    this.allNodes = allNodes;
    this.startPoint = startPoint??Offset(0,0);
  }

  void drawNode(Map node,Canvas canvas){
    double x = node["x"]??startPoint.dx;
    double y = node["y"]??startPoint.dy;
    double hPadding = node["hPadding"]??20;
    double vPadding = node["vPadding"]??10;
    double borderRadius = node["borderRadius"]??20;
    
    //text color
    Color color = node["color"]==null?Colors.white:Color(node["color"]);
    //background color
    Color backgroundColor = node["backgroundColor"]==null?Colors.blue:Color(node["backgroundColor"]);
    
    var paint = Paint();
    paint.color = backgroundColor;
    paint.strokeWidth = 2;

    TextSpan textSpan = new TextSpan(style: new TextStyle(color: color), text: node["text"]);
    TextPainter tp = new TextPainter(
        text: textSpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr
    );
    tp.layout();
      
    double width = tp.width+hPadding*2;
    double height = tp.height+vPadding*2;
    canvas.drawRRect(RRect.fromLTRBR(x, y, x+width, y+height, Radius.circular(borderRadius)), paint);
    tp.paint(canvas, new Offset(x+hPadding, y+vPadding));

    List children = node["children"];
    node["totalHeight"] = node["totalHeight"]??0;
    for(int i = 0 ;i <children.length;i++){
      var childNode = children[i];

      var sx = x + width/2 + 10;
      var sy = y + height + 20;

      childNode["totalHeight"] = height + 20 + childNode["children"].length * (height + 20) - 20;

      if(i>0){
        var prevNode = children[i-1];
        sy = prevNode["y"] + prevNode["totalHeight"] + 20;
      }

      childNode["y"] = sy;
      childNode["x"] = sx;
      drawNode(childNode,canvas);

      if(childNode["children"].length>0)node["totalHeight"] += childNode["totalHeight"]-height;

      canvas.drawLine(Offset(childNode["x"]-10,childNode["y"]+height/2), Offset(childNode["x"],childNode["y"]+height/2), paint);
      canvas.drawLine(Offset(childNode["x"]-10,childNode["y"]+height/2), Offset(childNode["x"]-10,y+height), paint);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    // var paint = Paint()
    //   ..isAntiAlias = true
    //   ..style = PaintingStyle.fill //填充
    //   ..color = Colors.yellow; //背景为纸黄色
    // canvas.drawRect(Offset.zero & size, paint);

    for (int i = allNodes.length - 1; i >= 0; i--) {
      Map node = allNodes[i];
      drawNode(node, canvas);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
    // throw UnimplementedError();
  }
}
