import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExampleAnimatedOpacity extends StatefulWidget {
  @override
  _ExampleAnimatedOpacityState createState() => _ExampleAnimatedOpacityState();
}

class _ExampleAnimatedOpacityState extends State<ExampleAnimatedOpacity> {
  double opacity = 1.0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
        children: [
              Container(
                color: Colors.grey[850],
                child: Text("""
                  AnimatedOpacity(
                    duration: Duration(seconds: 1),//动画时长
                    opacity: 1,//透明度0-1
                  }
                """,textAlign: TextAlign.left,style: TextStyle(color: Colors.white),),
              ),
              AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: opacity,
                child: ElevatedButton(
                  onPressed: (){
                    setState(() {
                      opacity = 0;
                    });
                  }, 
                  child: Text("点击后逐渐变透明")
                )
              ),
              Text("AnimatedOpacity的opacity属性值发生变化时，其子组件会产生动画效果")
            ]
        ),
      ),
    );
  }
}