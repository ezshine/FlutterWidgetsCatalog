import 'package:app/model/IconFontIcons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageDetail extends StatefulWidget {
  final Map info;
  PageDetail({Key key,this.info}) : super(key: key);

  @override
  _PageDetailState createState() => _PageDetailState();
}

class _PageDetailState extends State<PageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.info["title"]),
      ),
      body:Padding(
        padding: EdgeInsets.symmetric(vertical:20,horizontal:10), 
        child:ListView(
          children: [
            Text(widget.info["desc"]),
            ElevatedButton.icon(onPressed: (){}, icon: Icon(IconFontIcons.iconFile), label: Text("官网文档")),
            ElevatedButton.icon(onPressed: (){
              Navigator.pushNamed(context, "/examples/Example${widget.info['title']}");
            }, icon: Icon(IconFontIcons.iconExperiment), label: Text("使用示例")),
            ElevatedButton.icon(onPressed: (){}, icon: Icon(IconFontIcons.iconVideo), label: Text("视频教程")),
          ],
        ),
      )
    );
  }
}