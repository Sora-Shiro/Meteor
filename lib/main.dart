import 'package:flutter/material.dart';
import 'package:meteor/left_page.dart';
import 'package:meteor/mid_page.dart';
import 'package:meteor/right_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Ryuusei',
      theme: new ThemeData(
          brightness: Brightness.dark
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);


  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int bottomIndex = 1;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('流星'),
        ),
        body: new Container(
          padding: const EdgeInsets.all(2.0),
          child: new Stack(
            children: <Widget>[
              new Offstage(
                offstage: bottomIndex != 0,
                child: new TickerMode(
                  enabled: bottomIndex == 0,
                  child: new MaterialApp(home: new LeftPage()),
                ),
              ),
              new Offstage(
                offstage: bottomIndex != 1,
                child: new TickerMode(
                  enabled: bottomIndex == 1,
                  child: new MaterialApp(home: new MidPage()),
                ),
              ),
              new Offstage(
                offstage: bottomIndex != 2,
                child: new TickerMode(
                  enabled: bottomIndex == 2,
                  child: new MaterialApp(home: new RightPage()),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: new GestureDetector(
          onTap: () {
            setState(() {
              //
            });
          },
          child: new BottomNavigationBar(
            currentIndex: bottomIndex,
            items: [
              new BottomNavigationBarItem(
                icon: const Icon(Icons.star),
                title: new Text('远虑'),
              ),
              new BottomNavigationBarItem(
                icon: const Icon(Icons.star),
                title: new Text('近忧'),
              ),
              new BottomNavigationBarItem(
                icon: const Icon(Icons.star),
                title: new Text('焦虑一下'),
              )
            ],
            onTap: (int index) {
              print(index);
              setState(() {
                this.bottomIndex = index;
              });
            },
          ),
        )

    );
  }
}
