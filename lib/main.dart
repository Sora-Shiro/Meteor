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

class _MyHomePageState extends State<MyHomePage>
    with TickerProviderStateMixin {
  int _currentIndex = 1;
  int _beforeIndex = -1;
  AnimationController _animController;
  Animation _curve;
  Animation _tweenAlpha;
  AnimationStatus _animStatus;

  @override
  void initState() {
    super.initState();
    _animController = new AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _curve = new CurvedAnimation(parent: _animController, curve: Curves.easeIn);
    _tweenAlpha = new Tween(begin: 0.0, end: 1.0).animate(_curve)
      ..addListener(() {
        setState(() {

        });
      })
      ..addStatusListener((status) {
        setState(() {
          _animStatus = status;
        });
      });
    _animController.forward();
  }

  dispose() {
    _animController.dispose();
    super.dispose();
  }

  double calculateOpacity(index) {
    print(_tweenAlpha.value);
    if (_currentIndex == index && _beforeIndex != index) {
      return _curve.value;
    } else if (_currentIndex != index && _beforeIndex == index) {
      return 1.0 - _curve.value;
    }
    return 0.0;
  }


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
                offstage: _animStatus == AnimationStatus.completed &&
                    _currentIndex != 0,
                child: new Opacity(
                    opacity: calculateOpacity(0),
                    child: new TickerMode(
                      enabled: _currentIndex == 0,
                      child: new MaterialApp(home: new LeftPage()),
                    )),
              ),
              new Offstage(
                offstage: _animStatus == AnimationStatus.completed &&
                    _currentIndex != 1,
                child: new Opacity(
                    opacity: calculateOpacity(1),
                    child: new TickerMode(
                      enabled: _currentIndex == 1,
                      child: new MaterialApp(home: new MidPage()),
                    )),
              ),
              new Offstage(
                offstage: _animStatus == AnimationStatus.completed &&
                    _currentIndex != 2,
                child: new Opacity(
                    opacity: calculateOpacity(2),
                    child: new TickerMode(
                      enabled: _currentIndex == 2,
                      child: new MaterialApp(home: new RightPage()),
                    )),
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
            currentIndex: _currentIndex,
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
              setState(() {
                if (index != this._currentIndex) {
                  this._beforeIndex = this._currentIndex;
                  this._currentIndex = index;
                  _animController.forward(from: 0.0);
                }
              });
            },
          ),
        )

    );
  }
}
