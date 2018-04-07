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
        child: new TextField(
          enabled: true,
          decoration: const InputDecoration(
            labelText: '具体描述',
            border: const OutlineInputBorder(),
          ),
          maxLines: 5,
          style: Theme.of(context).textTheme.subhead,
        ),
      ),
    );
  }
}
