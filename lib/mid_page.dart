import 'package:flutter/material.dart';


class MidPage extends StatefulWidget {

  @override
  _MidPageState createState() => new _MidPageState();

}

class _MidPageState extends State<MidPage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
          child: new Text(
              "Mid Page"
          )
      ),
    );
  }
}