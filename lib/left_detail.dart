import 'package:flutter/material.dart';


class LeftDetailPage extends StatefulWidget {

  const LeftDetailPage(this.title, {Key key})
      : assert(title != null),
        super(key: key);

  final String title;

  @override
  _LeftDetailPageState createState() => new _LeftDetailPageState(title);

}

class _LeftDetailPageState extends State<LeftDetailPage> {

  _LeftDetailPageState(this.title)
      : super();

  String title;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text(title),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.dehaze),
            tooltip: '更多',
            onPressed: onAppBarPressed,
          ),
        ],
      ),
    );
  }

  void onAppBarPressed() {

  }

}