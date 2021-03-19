import 'dart:math';

import 'package:flutter/material.dart';

class ExampleAnimatedAlign extends StatefulWidget {
  ExampleAnimatedAlign({Key key}) : super(key: key);

  @override
  _ExampleAnimatedAlignState createState() => _ExampleAnimatedAlignState();
}

class _ExampleAnimatedAlignState extends State<ExampleAnimatedAlign> {
  
  Alignment alignment = Alignment.center;
  
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
      AnimatedAlign(
        duration: Duration(seconds: 1),//动画持续时长
        alignment: alignment,
        child: ElevatedButton(onPressed: (){}, child: Text("按钮")),
      )
                  """,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white)
                ),
              ),
              AnimatedAlign(
                alignment: alignment,
                duration: Duration(seconds: 1),
                child: ElevatedButton(onPressed: (){}, child: Text("按钮")),
              ),
              Text("AnimatedAlign组件的alignment改变时会有动画效果"),
              ElevatedButton(onPressed: (){
                alignment = [Alignment.centerLeft,Alignment.center,Alignment.centerRight][Random().nextInt(3)];
                setState(() {
                  
                });
              }, child: Text("现在是 $alignment ，点击切换"))
            ]
        ),
      ),
    );
  }
}