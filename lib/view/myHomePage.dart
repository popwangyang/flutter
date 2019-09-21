import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "new_page");
              },
            ),
            FlatButton(
              child: Text("打开路由传递参数"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("new_page1", arguments: "H1");
              },
            ),
            FlatButton(
              child: Text("打开不存在的路由"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("new_page3", arguments: "H1");
              },
            ),
            FlatButton(
              child: Text("打开Counter页面"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed('new_page2');
              },
            ),
            FlatButton(
              child: Text("打开Scaffoldv页面"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed('new_page4');
              },
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}