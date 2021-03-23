import 'package:flutter/material.dart';

class ExampleAnimatedListState extends StatefulWidget {
  ExampleAnimatedListState({Key key}) : super(key: key);

  @override
  _ExampleAnimatedListStateState createState() =>
      _ExampleAnimatedListStateState();
}

class _ExampleAnimatedListStateState extends State<ExampleAnimatedListState> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  List _list = [
    "AnimatedListState要配合AnimatedList使用",
    "当我们对ListView中的条目新增或删减时执行动画",
    "可以执行任意动画效果",
    "请查看本示例代码"
  ];

  addItem() {
    final int _index = _list.length;

    _list.insert(_index, _index);

    _listKey.currentState.insertItem(_index);
  }

  removeItem() {
    final int _index = _list.length - 1;

    _listKey.currentState.removeItem(_index, (context, animation) {
      return _buildItem("item$_index", animation);
    });
    _list.removeAt(_index);
  }

  Widget _buildItem(String _item, Animation _animation) {
    return SlideTransition(
      position: _animation
          .drive(CurveTween(curve: Curves.easeIn))
          .drive(Tween<Offset>(begin: Offset(1, 1), end: Offset(0, 1))),
      child: ListTile(
        tileColor: Colors.red,
        title: Text(
          _item,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: AnimatedList(
            initialItemCount: _list.length,
            key: _listKey,
            itemBuilder:
                (BuildContext context, int index, Animation<double> animation) {
              return _buildItem(_list[index].toString(), animation);
            }),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                child: Text("添加"),
                onPressed: addItem
            ),
            ElevatedButton(
                child: Text("删除"),
                onPressed: removeItem
            ),
          ],
        ));
  }
}
