import 'dart:math';

import 'package:flutter/material.dart';

class ExampleAnimatedContainer extends StatefulWidget {
  ExampleAnimatedContainer({Key key}) : super(key: key);

  @override
  _ExampleAnimatedContainerState createState() => _ExampleAnimatedContainerState();
}

class _ExampleAnimatedContainerState extends State<ExampleAnimatedContainer> {
  
  double width = 100.0;
  double height = 100.0;
  Color color = Colors.red;
  
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
      Center(
          child: AnimatedContainer(
            duration: Duration(seconds: 1),//required
            width: width,
            height: height,
            color: color,
          ),
        ),
                """,textAlign: TextAlign.left,style: TextStyle(color: Colors.white),),
              ),
              Center(
                child: AnimatedContainer(
                  width: width,
                  height: height,
                  duration: Duration(seconds: 1),
                  color: color,
                ),
              ),
              ElevatedButton(onPressed: (){
                setState(() {
                  width = Random().nextDouble()*50+50;
                  height = Random().nextDouble()*50+50;
                  color = Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);
                });
              }, child: Text("随机动画")),
              Text("AnimatedContainer的属性变化时会产生动画效果")
            ]
        ),
      ),
    );
  }
}