import 'package:app/model/WidgetsJson.dart';
import 'package:app/view/pages/detail.dart';
import 'package:flutter/material.dart';

class PageIndexed extends StatefulWidget {
  PageIndexed({Key key}) : super(key: key);

  @override
  _PageIndexedState createState() => _PageIndexedState();
}

class _PageIndexedState extends State<PageIndexed> with AutomaticKeepAliveClientMixin{
  
  @override
  bool get wantKeepAlive => true;

  List<Map> list = [];

  @override
  void initState() {
    super.initState();
    
    parseCata(WidgetsJson.data);
    list.sort((Map a, Map b)=>a["title"].compareTo(b["title"]));
  }

  void parseCata(Map cataMap){
    if(cataMap.containsKey("list")){
      List cataList = cataMap["list"];
      for(var i = cataList.length -1 ;i>=0;i--){
        parseCata(cataList[i]);
      }
    }else{
      bool exists = list.any((item){
        if(item["title"] == cataMap["title"]){
          return true;
        }
        return false;
      });

      if(!exists){
        list.add(cataMap);
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ListView.separated(
      itemBuilder: (BuildContext context,int index){
        return ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
              return PageDetail(info:list[index],videoUrl: "https://www.bilibili.com/video/BV1rz4y117D6?p=${index+2}");
            }));
          },
          title: Text(list[index]["title"],style: TextStyle(fontSize: 20)),
          // subtitle: Text(list[index]["desc"])
        );
      }, 
      separatorBuilder: (BuildContext context,int index){
        return Divider();
      }, 
      itemCount: list.length
    );
  }
}