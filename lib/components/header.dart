import 'package:flutter/material.dart';
import 'package:flutter_app/components/fonts.dart';
import 'package:flutter_app/components/myOverlay.dart';





class Header extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HeaderState();
  }
}




class _HeaderState extends State<Header>{

  GlobalKey _key = GlobalKey();

  MyOverlay myOverlay;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      margin: EdgeInsets.only(top: 00.0, left: 0.0),
      padding: EdgeInsets.only(top: 20.0),
      constraints: BoxConstraints.tightFor(
        height: 80.0,
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
              child: GestureDetector(
                child: Container(
                  height: 38.0,
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: InputContent(),
                ),
                onTap: (){
                  Navigator.of(context).pushNamed('searchPage');
                },
              )
            ),
            GestureDetector(
              key: _key,
              child: Container(
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
                      ),
                    ],
                  )
              ),
              onTap: _showPup,
            )
          ],
        ),
      )
      );
  }


  void _foo(int value) {
    print(value);
    myOverlay.remove();

  }

  _showPup(){
    Widget a = Column(
      children: <Widget>[
        Item(
            icon: MyIcons.player,
            text: "视频播放",
            label: 1,
            onChange: _foo
        ),
        Item(
            icon: MyIcons.camera,
            text: "扫码付款",
            label: 2,
            onChange: _foo
        ),
        Item(
            icon: MyIcons.search,
            text: "收搜美容",
            label: 3,
            onChange: _foo
        ),
        Item(
            icon: MyIcons.home,
            text: "返回首页",
            label: 4,
            onChange: _foo
        ),
      ],
    );

    myOverlay = Overlay1.show1(
      context: context,
      color: Colors.transparent,
      key: _key,
      child: a,
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


class Item extends StatelessWidget{

  Item({Key key, this.icon, this.text, this.label, this.onChange}): super(key: key);

  final IconData icon;

  final String text;
  final int label;

  final ValueChanged<int> onChange;


  void _btn(){
    onChange(label);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 22.0,
        margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
        child: GestureDetector(
          child: Row(
            children: <Widget>[
              Icon(icon, size: 18, color: Colors.white,),
              Expanded(
                flex: 1,
                child: Text(text,
                  textAlign: TextAlign.right,
                  style:  TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                ),
              )
            ],
          ),
          onTap: _btn,
        )
    );
  }
}