import 'package:flutter/material.dart';

class Scaoldv extends StatefulWidget {

  Scaoldv({Key key}): super(key: key);

  @override
  _ScaoldvState createState() => new _ScaoldvState();
}

class _ScaoldvState extends State<Scaoldv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("子树中获取State对象"),
      ),
      body: Center(
        child: Builder(builder: (context) {
          return RaisedButton(
            onPressed: () {
              // 查找父级最近的Scaffold对应的ScaffoldState对象
              ScaffoldState _state = context.ancestorStateOfType(
                  TypeMatcher<ScaffoldState>());
              //调用ScaffoldState的showSnackBar来弹出SnackBar
              _state.showSnackBar(
                SnackBar(
                  content: Text("我是SnackBar"),
                ),
              );
            },
            child: Text("显示SnackBar"),
          );
        }),
      ),
    );
  }
}
