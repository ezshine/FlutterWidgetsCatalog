import 'package:app/model/IconFontIcons.dart';
import 'package:app/model/WidgetsJson.dart';
import 'package:app/view/components/ezflutter/EZMindMap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageCatalog extends StatefulWidget {
  PageCatalog({Key key}) : super(key: key);

  @override
  _PageCatalogState createState() => _PageCatalogState();
}

class _PageCatalogState extends State<PageCatalog> {
  
  EZMindMap mindMap;

  var rootNode;

  @override
  void initState() {
    super.initState();

    mindMap = new EZMindMap();

    rootNode = mindMap.addNode("Widgets Catalog (${WidgetsJson.data['total']})");

    var list = WidgetsJson.data["catalog"];

    addNodeFromList(list,rootNode);
  }

  void addNodeFromList(List list,node){
    for(var i = 0 ; i <list.length;i++){
      Map item = list[i];

      var cnode = mindMap.addNode(item["title"],node);

      if(item.containsKey("list"))addNodeFromList(item["list"],cnode);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mindMap
    );
  }
}