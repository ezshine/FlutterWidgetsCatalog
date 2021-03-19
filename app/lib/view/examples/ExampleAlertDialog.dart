import 'package:flutter/material.dart';

class ExampleAlertDialog extends StatefulWidget {
  ExampleAlertDialog({Key key}) : super(key: key);

  @override
  _ExampleAlertDialogState createState() => _ExampleAlertDialogState();
}

class _ExampleAlertDialogState extends State<ExampleAlertDialog> {
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
      AlertDialog(
        title: Text("这是标题"),
        content: Text("这是内容"),
        elevation: 10,//控制立体阴影高度
        actions: [
          ElevatedButton(onPressed: (){}, child: Text("取消"),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey)),),
          ElevatedButton(onPressed: (){}, child: Text("确定"))
        ],
      )
                """,textAlign: TextAlign.left,style: TextStyle(color: Colors.white),),
              ),
              AlertDialog(
                title: Text("这是标题"),
                content: Text("这是内容"),
                elevation: 10,
                actions: [
                  ElevatedButton(onPressed: (){}, child: Text("取消"),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey)),),
                  ElevatedButton(onPressed: (){}, child: Text("确定"))
                ],
              ),
              Text("AlertDialog是一个对话框组件")
            ]
        ),
      ),
    );
  }
}