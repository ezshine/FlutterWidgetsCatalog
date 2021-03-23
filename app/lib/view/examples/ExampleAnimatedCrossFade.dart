import 'package:flutter/material.dart';

class ExampleAnimatedCrossFade extends StatefulWidget {
  ExampleAnimatedCrossFade({Key key}) : super(key: key);

  @override
  _ExampleAnimatedCrossFadeState createState() => _ExampleAnimatedCrossFadeState();
}

class _ExampleAnimatedCrossFadeState extends State<ExampleAnimatedCrossFade> {
  
  CrossFadeState fadeState = CrossFadeState.showFirst;
  
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
    AnimatedCrossFade(
      firstChild: Container(
        width: 100,
        height: 100,
        color: Colors.red,
        child: Center(child:Text("first child"))
      ), 
      secondChild: Container(
        width: 100,
        height: 100,
        color: Colors.blue,
        child: Center(child:Text("second child"))
      ), 
      crossFadeState: fadeState, 
      duration: Duration(seconds: 1)
    )
                """,textAlign: TextAlign.left,style: TextStyle(color: Colors.white),),
              ),
              Center(
                child:AnimatedCrossFade(
                  firstChild: Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                    child: Center(child:Text("first child"))
                  ), 
                  secondChild: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                    child: Center(child:Text("second child"))
                  ), 
                  crossFadeState: fadeState, 
                  duration: Duration(seconds: 1)
                )
              ),
              ElevatedButton(onPressed: (){
                setState(() {
                  if(fadeState == CrossFadeState.showFirst)fadeState = CrossFadeState.showSecond;
                  else fadeState = CrossFadeState.showFirst;
                });
              }, child: Text("切换")),
              Text("AnimatedCrossFade可以在两个子组件间切换并具备淡入淡出的动画效果")
            ]
        ),
      ),
    );
  }
}