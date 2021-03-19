import 'package:flutter/material.dart';

class ExampleAlign extends StatefulWidget {
  ExampleAlign({Key key}) : super(key: key);

  @override
  _ExampleAlignState createState() => _ExampleAlignState();
}

class _ExampleAlignState extends State<ExampleAlign> {
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
      Align(
        alignment: Alignment.topRight,//默认值是center
        child: ElevatedButton(onPressed: (){}, child: Text("按钮")),
      ),
                  """,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white)
                ),
              ),
              Text("按钮靠左"),
              Align(
                alignment: Alignment.topLeft,
                child: ElevatedButton(onPressed: (){}, child: Text("按钮")),
              ),
              Align(
                alignment: Alignment.topRight,
                child:Text("按钮靠右")
              ),
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(onPressed: (){}, child: Text("按钮")),
              ),
            ]
        ),
      ),
    );
  }
}