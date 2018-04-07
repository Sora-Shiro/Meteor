// Block, see https://github.com/flutter/flutter/issues/6602 
// and https://github.com/flutter/flutter/issues/10826 .
// Currently, when keyboard shows, TextField or TextFormField will be
// hidden if they at the bottom.


import 'dart:async';

import 'package:flutter/material.dart';

class LeftDetailPage extends StatefulWidget {
  const LeftDetailPage(this.title, {Key key})
      : assert(title != null),
        super(key: key);

  final String title;

  @override
  _LeftDetailPageState createState() => new _LeftDetailPageState();
}

class _LeftDetailPageState extends State<LeftDetailPage> {
  DateTime _toDate;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _toDate = new DateTime.now();
    getListData();
  }

  void getListData() {}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text(widget.title),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.dehaze),
            tooltip: '更多',
            onPressed: onDehazePressed,
          ),
        ],
      ),
      body: new Container(
          padding: const EdgeInsets.all(20.0),
          child: new ListView(
            children: <Widget>[
              new Text(
                "步骤 1",
                style: Theme.of(context).textTheme.display1,
              ),
              new SizedBox(
                height: 10.0,
              ),
              new TextField(
                enabled: true,
                decoration: const InputDecoration(
                  labelText: '目标',
                  border: const OutlineInputBorder(),
                ),
                style: Theme.of(context).textTheme.subhead,
              ),
              new SizedBox(
                height: 10.0,
              ),
              new Text(
                  "开始时间： "
                  "loading",
                  style: new TextStyle(
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center),
              new SizedBox(
                height: 10.0,
              ),
              new _DatePicker(
                selectedDate: _toDate,
                selectDate: (DateTime datetime) {
                  setState(() {
                    _toDate = datetime;
                  });
                },
              ),
              new SizedBox(
                height: 10.0,
              ),
              new TextField(
                enabled: true,
                decoration: const InputDecoration(
                  labelText: '具体描述',
                  border: const OutlineInputBorder(),
                ),
                maxLines: 5,
                style: Theme.of(context).textTheme.subhead,
              ),
            ],
          )),
    );
  }

  void onDehazePressed() async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2015, 8),
        lastDate: new DateTime(2101));
    if (picked != null) print(picked);
  }

  void onListItemTapped(int index) {
    showModalBottomSheet(
        context: _scaffoldKey.currentContext,
        builder: (BuildContext context) {
          return new Container(
              child: new Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: new Text("Text")));
        });
  }

  void onListItemLongPressed(int index) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text("text")));
  }
}

class _DatePicker extends StatelessWidget {
  const _DatePicker({
    Key key,
    this.selectedDate,
    this.selectDate,
  }) : super(key: key);

  final DateTime selectedDate;
  final ValueChanged<DateTime> selectDate;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: new DateTime(2015, 8),
        lastDate: new DateTime(2101));
    if (picked != null && picked != selectedDate) selectDate(picked);
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        new Expanded(
          flex: 2,
          child: new Text("结束时间",
              style: new TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center),
        ),
        new Expanded(
          flex: 3,
          child: new InkWell(
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    selectedDate.year.toString() +
                        " 年 " +
                        selectedDate.month.toString() +
                        " 月 " +
                        selectedDate.day.toString() +
                        " 日",
                    style: new TextStyle(
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  new Icon(Icons.arrow_drop_down,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.grey.shade700
                          : Colors.white70)
                ]),
            onTap: () {
              _selectDate(context);
            },
          ),
        ),
      ],
    );
  }
}
