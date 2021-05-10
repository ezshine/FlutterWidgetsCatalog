import 'dart:math';

import 'package:flutter/material.dart';

class ExampleAnimatedPhysicalModel extends StatefulWidget {
  @override
  _ExampleAnimatedPhysicalModelState createState() => _ExampleAnimatedPhysicalModelState();
}

class _ExampleAnimatedPhysicalModelState extends State<ExampleAnimatedPhysicalModel> {
  double elevation = 10;
  BorderRadius boardRadius = BorderRadius.all(Radius.circular(10));

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
                  AnimatedPhysicalModel(
                    duration: Duration(seconds: 1),
                    color:Colors.red,
                    elevation: elevation, 
                    shadowColor: Colors.black,
                    child: Container(width: 100,height: 100),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  )
                """,textAlign: TextAlign.left,style: TextStyle(color: Colors.white),),
              ),
              Padding(
                padding: EdgeInsets.all(50),
                child: AnimatedPhysicalModel(
                  duration: Duration(seconds: 1),
                  color:Colors.red,
                  elevation: elevation, 
                  shadowColor: Colors.black,
                  child: Container(width: 100,height: 100),
                  shape: BoxShape.rectangle,
                  borderRadius: boardRadius,
                ),
              ),
              ElevatedButton(onPressed: (){
                setState(() {
                  boardRadius = BorderRadius.all(Radius.circular(Random().nextInt(20).toDouble()));
                  elevation = Random().nextInt(20).toDouble();
                });
              }, child: Text("改变属性")),
              Text("PhysicalModel是一个可以设定阴影，圆角和等属性的单子组件容器，AnimatedPhysicalModel在更改属性值时会产生动画效果")
            ]
        ),
      )
    );
  }
}