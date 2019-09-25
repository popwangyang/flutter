import 'package:flutter/material.dart';

class Hotspots extends StatelessWidget{

  Hotspots({Key key, this.list}):super(key: key);

  final List list;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Item(text: list[0]),
            Separator(),
            Item(text: list[1]),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Item(text: list[2]),
            Separator(),
            Item(text: list[3]),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: Divider(
            height: 1.0,
            color: Colors.grey
          ),
        )
      ],
    );
  }
}

class Item extends StatelessWidget{

  Item({Key key, this.text}):super(key:key);
  final String text;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Container(
          child: Text(text,
            style: TextStyle(
                fontSize: 16.0,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      )
    );
  }
}


// 竖杠分隔符;
class Separator extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      width: 1,
      height: 16,
      color: Colors.grey,
      margin: EdgeInsets.only(left: 10, right: 10),
    );
  }
}