import 'dart:math';

import 'package:flutter/material.dart';

class ExampleAnimatedDefaultTextStyle extends StatefulWidget {
  ExampleAnimatedDefaultTextStyle({Key key}) : super(key: key);

  @override
  _ExampleAnimatedDefaultTextStyleState createState() => _ExampleAnimatedDefaultTextStyleState();
}

class _ExampleAnimatedDefaultTextStyleState extends State<ExampleAnimatedDefaultTextStyle> {
  
  Color color = Colors.red;
  double fontSize = 24.0;
  
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
            AnimatedDefaultTextStyle(
              child: Text("文字"), 
              style: TextStyle(color: color,fontSize: fontSize), 
              duration: Duration(seconds: 1)
            )
                """,textAlign: TextAlign.left,style: TextStyle(color: Colors.white),),
              ),
              Center(
                child:AnimatedDefaultTextStyle(
                  child: Text("文字"), 
                  style: TextStyle(color: color,fontSize: fontSize), 
                  duration: Duration(seconds: 1)
                )
              ),
              ElevatedButton(onPressed: (){
                setState(() {
                  fontSize = Random().nextDouble()*40+24;
                  color = Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);
                });
              }, child: Text("切换字体大小颜色")),
              Text("改变AnimatedDefaultTextStyle的style中的属性时，其子元素的文本样式会以动画的方式改变style")
            ]
        ),
      ),
    );
  }
}