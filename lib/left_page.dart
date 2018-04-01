import 'package:flutter/material.dart';


class LeftPage extends StatefulWidget {

  @override
  _LeftPageState createState() => new _LeftPageState();

}

class _LeftPageState extends State<LeftPage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
          child: new Text(
            "Left Page",
            style: new TextStyle(
              decoration: TextDecoration.none,
            ),
          )
      ),
    );
  }
}