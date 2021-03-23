import 'package:app/model/IconFontIcons.dart';
import 'package:app/view/examples/ExampleAbsorbPointer.dart';
import 'package:app/view/examples/ExampleAlertDialog.dart';
import 'package:app/view/examples/ExampleAlign.dart';
import 'package:app/view/examples/ExampleAnimatedAlign.dart';
import 'package:app/view/examples/ExampleAnimatedBuilder.dart';
import 'package:app/view/examples/ExampleAnimatedContainer.dart';
import 'package:app/view/examples/ExampleAnimatedCrossFade.dart';
import 'package:app/view/examples/ExampleAnimatedDefaultTextStyle.dart';
import 'package:app/view/examples/ExampleAnimatedListState.dart';
import 'package:app/view/pages/catalog.dart';
import 'package:app/view/pages/detail.dart';
import 'package:app/view/pages/indexed.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Widgets Catalog'),
      routes: {
        "/examples/ExampleAbsorbPointer":(BuildContext context) => ExampleAbsorbPointer(),
        "/examples/ExampleAlertDialog":(BuildContext context) => ExampleAlertDialog(),
        "/examples/ExampleAlign":(BuildContext context) => ExampleAlign(),
        "/examples/ExampleAnimatedAlign":(BuildContext context) => ExampleAnimatedAlign(),
        "/examples/ExampleAnimatedBuilder":(BuildContext context) => ExampleAnimatedBuilder(),
        "/examples/ExampleAnimatedContainer":(BuildContext context) => ExampleAnimatedContainer(),
        "/examples/ExampleAnimatedCrossFade":(BuildContext context) => ExampleAnimatedCrossFade(),
        "/examples/ExampleAnimatedDefaultTextStyle":(BuildContext context) => ExampleAnimatedDefaultTextStyle(),
        "/examples/ExampleAnimatedListState":(BuildContext context) => ExampleAnimatedListState()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int currentBottomNav = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    super.dispose();

    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          PageIndexed(),
          PageCatalog()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white30,
        currentIndex: currentBottomNav,
        onTap: (int index){
          setState(() {
            currentBottomNav = index;
            _pageController.jumpToPage(currentBottomNav);
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(IconFontIcons.iconSortAscending),label: "索引"),
          BottomNavigationBarItem(icon: Icon(IconFontIcons.iconApartment),label: "地图"),
        ],
      ),
    );
  }
}
