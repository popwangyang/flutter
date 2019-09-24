import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/view/Animation/Animation.dart';

class IndexPage extends StatelessWidget{
  IndexPage({Key key}) : super(key : key);

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('首页'),
      ),
      body: new Container(
        padding: EdgeInsets.all(10.0),
        child: new Wrap(
          children: <Widget>[
             FlatButton(
              child: Text('文本及样式'),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed('index');
              },
            ),
            FlatButton(
               child: Text('Container容器'),
               textColor: Colors.blue,
               onPressed: () {
                 Navigator.of(context).pushNamed('container');
               },
             ),
            FlatButton(
              child: Text('List组件'),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.of(context).pushNamed('listComponent');
              },
            ),
            FlatButton(
              child: Text('animation动画'),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.of(context).pushNamed('animationPage');
              },
            ),
            FlatButton(
              child: Text('路由动画'),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, CupertinoPageRoute(
                  builder: (context) => AnimationPage()
                ));
              },
            ),
            FlatButton(
              child: Text('Hero动画'),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.of(context).pushNamed('heroPage');
              },
            ),
            FlatButton(
              child: Text('PopupMenuButton'),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.of(context).pushNamed('PopupMenuButton');
              },
            ),
            FlatButton(
              child: Text('Overlay'),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.of(context).pushNamed('Overlay');
              },
            ),
            FlatButton(
              child: Text('Event'),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.of(context).pushNamed('eventPage');
              },
            ),
          ],
        ),
      ),
    ) ;
  }
}