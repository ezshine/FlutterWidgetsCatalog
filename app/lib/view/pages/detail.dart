import 'package:flutter/widgets.dart';

class PageDetail extends StatefulWidget {
  PageDetail({Key key}) : super(key: key);

  @override
  _PageDetailState createState() => _PageDetailState();
}

class _PageDetailState extends State<PageDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(child:Text("详情")),
    );
  }
}