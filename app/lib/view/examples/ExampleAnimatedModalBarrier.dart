import 'package:flutter/material.dart';

class ExampleAnimatedModalBarrier extends StatefulWidget {
  ExampleAnimatedModalBarrier({Key key}) : super(key: key);

  @override
  _ExampleAnimatedModalBarrierState createState() => _ExampleAnimatedModalBarrierState();
}

class _ExampleAnimatedModalBarrierState extends State<ExampleAnimatedModalBarrier> with SingleTickerProviderStateMixin {
  
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {

    _controller = AnimationController(duration: Duration(milliseconds: 1000),vsync: this);

    _animation = ColorTween(begin: Colors.red,end: Colors.blue).animate(_controller);

    _controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
        children: [
              Container(
                color: Colors.grey[850],
                child: Text("""
                  AnimatedModalBarrier(
                    dismissible: false,//点击后是否自动pop
                    color: _animation//动画控制器
                  )
                """,textAlign: TextAlign.left,style: TextStyle(color: Colors.white),),
              ),
              Container(
                width: 100,
                height: 100,
                child:AnimatedModalBarrier(
                  dismissible: false,
                  color: _animation
                ),
              ),
              Text("AnimatedModalBarriers是一个带颜色切换动画的覆盖层，用于自定义弹窗的背景色")
            ]
        ),
      ),
    );
  }
}