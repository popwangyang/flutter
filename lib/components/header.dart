import 'package:flutter/material.dart';
import 'package:flutter_app/components/fonts.dart';









class Header extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      margin: EdgeInsets.only(top: 00.0, left: 0.0),
      padding: EdgeInsets.only(top: 20.0),
      constraints: BoxConstraints.tightFor(
        height: 70.0,
      ),
      decoration: BoxDecoration(
        color: Colors.red,
      ),
      transform: Matrix4.rotationZ(0.0),
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(top: 6.0, left: 12.0, right: 12.0, bottom: 6.0),
        constraints: BoxConstraints.tightFor(
          height: 50.0,
        ),
        alignment: Alignment.centerLeft,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: 38.0,
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3.0),
                ),
                child: InputContent(),

              ),
            ),
            Container(
              width: 38.0,
              height: 38.0,
              margin: EdgeInsets.only(left: 4.0),
              child: Column(
                children: <Widget>[
                  Icon(
                    MyIcons.camera,
                    color: Colors.white,
                    size: 22.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2.0),
                    child: Text('发布',
                      style: TextStyle(
                        fontSize: 9.0,
                        color: Colors.white,
                      ),
                    ),
                  )

                ],
              )
            )
          ],
        ),
      )
      );
  }
}

//  输入框里的文字样式

class InputContent extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Container(
          width: 28.0,
          height: 38.0,
          child: Icon(
            MyIcons.search,
            color: Colors.black,
            size: 18.0,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 38.0,
            alignment: Alignment.centerLeft,
            child: Text("刨煤机承认UFO视频|继承来那个搜索我|刨煤机承认UFO视频|继承来那个搜索我",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
              ),
            ),
          ),
        )
      ],

    );
  }
}