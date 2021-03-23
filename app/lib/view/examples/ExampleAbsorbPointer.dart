import 'package:flutter/material.dart';

class ExampleAbsorbPointer extends StatefulWidget {
  ExampleAbsorbPointer({Key key}) : super(key: key);

  @override
  _ExampleAbsorbPointerState createState() => _ExampleAbsorbPointerState();
}

class _ExampleAbsorbPointerState extends State<ExampleAbsorbPointer> {
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
      AbsorbPointer(
        absorbing: true,//默认值是true
        child: ElevatedButton(onPressed: (){}, child: Text("被AbsorbPointer的包裹的按钮")),
      )
                """,textAlign: TextAlign.left,style: TextStyle(color: Colors.white),),
              ),
              TextField(),
              AbsorbPointer(
                absorbing: true,
                child: TextField(),
              )
            ]
        ),
      ),
    );
  }
}