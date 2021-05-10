import 'dart:math';

import 'package:flutter/material.dart';

class ExampleAnimatedPositioned extends StatefulWidget {
  @override
  _ExampleAnimatedPositionedState createState() =>
      _ExampleAnimatedPositionedState();
}

class _ExampleAnimatedPositionedState extends State<ExampleAnimatedPositioned> {
  
  @override
  Widget build(BuildContext context) {
    double left = Random().nextInt(200-64).toDouble();
    double top = Random().nextInt(200-36).toDouble();
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(children: [
            Container(
              color: Colors.grey[850],
              child: Text(
                """
                  AnimatedPositioned(
                        duration: Duration(seconds: 1),
                        left: left,
                        top:top,
                        child://子组件
                  )
                """,
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.grey[200],
                child: Stack(
                  children: [
                    AnimatedPositioned(
                        duration: Duration(seconds: 1),
                        left: left,
                        top:top,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                
                              });
                            }, 
                            child: Text("点了就跑")
                          )
                        )
                  ],
                ),
              ),
            ),
            Text(
                "Positioned配合Stack布局，可以放置在任意坐标，AnimatedPositioned则在更改left,top属性值时会产生动画效果")
          ]),
        ));
  }
}
