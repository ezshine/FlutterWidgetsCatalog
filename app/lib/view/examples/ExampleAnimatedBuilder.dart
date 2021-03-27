import 'package:flutter/material.dart';

class ExampleAnimatedBuilder extends StatefulWidget {
  ExampleAnimatedBuilder({Key key}) : super(key: key);

  @override
  _ExampleAnimatedBuilderState createState() => _ExampleAnimatedBuilderState();
}

class _ExampleAnimatedBuilderState extends State<ExampleAnimatedBuilder> with SingleTickerProviderStateMixin {
  
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this
    );
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }
  
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
        child: AnimatedBuilder(
          animation: controller, 
          builder: (BuildContext context,Widget widget){
            return Container(
              width: controller.value*100,
              height: 100,
              color: Colors.red,
              child: Center(
                child: Text("文字",style: TextStyle(color: Color.fromRGBO(255, (255*controller.value).toInt(), 255, 1)),),
              ),
            );
          }
        ),
      ),
                """,textAlign: TextAlign.left,style: TextStyle(color: Colors.white),),
              ),
              Center(
                child: AnimatedBuilder(
                  animation: controller, 
                  builder: (BuildContext context,Widget widget){
                    return Container(
                      width: controller.value*100,
                      height: 100,
                      color: Colors.red,
                      child: Center(
                        child: Text("文字",style: TextStyle(color: Color.fromRGBO(255, (255*controller.value).toInt(), 255, 1)),),
                      ),
                    );
                  }
                ),
              ),
              Text("当AnimatedXXXX或XXXXTransition无法满足你对动画的需求时，比如连续循环的动画，那么你该看看AnimatedBuilder，它需要一个animationController但无需监听Listener。在动画执行期间会不断调用builder。")
            ]
        ),
      ),
    );
  }
}