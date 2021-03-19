import 'package:app/view/pages/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EZJellyClock extends StatefulWidget {
  EZJellyClock({Key key}) : super(key: key);

  @override
  _EZJellyClockState createState() => _EZJellyClockState();
}

class _EZJellyClockState extends State<EZJellyClock> with TickerProviderStateMixin {
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
       child: ListView.builder(itemBuilder: (BuildContext context,int index){
         return ListTile(
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
               return PageDetail();
             }));
           },
           leading: Hero(tag:"image$index",child: Image.asset("assets/images/test.jpg"))
         );
       }),
    );
  }
}