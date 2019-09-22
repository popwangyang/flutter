import 'package:flutter/material.dart';

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
        child: new Row(
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
            )
          ],
        ),
      ),
    ) ;
  }
}