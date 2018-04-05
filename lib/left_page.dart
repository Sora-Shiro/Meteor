import 'package:Ryuusei/left_detail.dart';
import 'package:flutter/material.dart';


class LeftPage extends StatefulWidget {

  @override
  _LeftPageState createState() => new _LeftPageState();

}

class _LeftPageState extends State<LeftPage> with TickerProviderStateMixin {

  List _listData;
  int _tapListIndex;
  int _longPressListIndex;

  @override
  void initState() {
    super.initState();
    getListData();
  }

  void getListData() {
    _listData = [
      {
        "leading": new Icon(
          Icons.event,
          color: Colors.white,
        ),
        "trailing": null,
        "title_text": "Foresight 1",
        "subtitle_text": "Foresight 1 Detail",
      },
      {
        "leading": new Icon(
          Icons.event,
          color: Colors.white,
        ),
        "trailing": null,
        "title_text": "Foresight 2",
        "subtitle_text": "Foresight 2 Detail",
      },
      {
        "leading": new Icon(
          Icons.event,
          color: Colors.white,
        ),
        "trailing": null,
        "title_text": "Foresight 3",
        "subtitle_text": "Foresight 3 Detail",
      },
      {
        "leading": new Icon(
          Icons.event,
          color: Colors.white,
        ),
        "trailing": null,
        "title_text": "Foresight 4",
        "subtitle_text": "Foresight 4 Detail",
      },
      {
        "leading": new Icon(
          Icons.event,
          color: Colors.white,
        ),
        "trailing": null,
        "title_text": "Foresight 5",
        "subtitle_text": "Foresight 5 Detail",
      },
    ];
  }

  Widget generateListItem(BuildContext buildContext, int index) {
    if (index & 1 == 0) {
      var data = _listData[index ~/ 2];
      return new ListTile(
        leading: data["leading"],
        trailing: data["trailing"],
        isThreeLine: false,
        title: new Text(
          data["title_text"],
          style: new TextStyle(
              color: Colors.white
          ),
        ),
        subtitle: new Text(
          data["subtitle_text"],
          style: new TextStyle(
              color: Colors.white
          ),
        ),
        enabled: true,
        onTap: () {
          setState(() {
            _tapListIndex = index;
            Navigator.of(context).push(
                new PageRouteBuilder(
                  pageBuilder: (_, __, ___) =>
                  new LeftDetailPage(data["title_text"]),
                )
            );
          });
        },
        onLongPress: () {
          setState(() {
            _longPressListIndex = index;
          });
        },
      );
    } else {
      return new Divider(
        color: Colors.white70,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Container(
            child: new CustomScrollView(
              shrinkWrap: true,
              slivers: <Widget>[
                new SliverPadding(
                    padding: const EdgeInsets.all(20.0),
                    sliver: new SliverList(
                      delegate: new SliverChildBuilderDelegate(
                        generateListItem,
                        childCount: 2 * _listData.length - 1,
                      ),
                    )
                )
              ],
            )
        )
    );
  }
}