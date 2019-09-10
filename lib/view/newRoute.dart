import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new JsonView(),
            new Text("ppppp"),
            new ImageView(),
            new BoxView(),
            new Button(),
          ],
        ),
      )
    );
  }
}

class JsonView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _JsonViewState();
  }
}

class _JsonViewState extends State<JsonView> {
  Future future;

  @override
  void initState() {
    super.initState();
    future = _loadAsset();

  }

  Future<String> _loadAsset() async {
    return await rootBundle.loadString('lib/assets/config.json');
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
//      future: DefaultAssetBundle.of(context).loadString("lib/assets/config.json"),
      future: future,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('Press Button to start.');
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Text("Awaiting result...");
          case ConnectionState.done:
            if(snapshot.hasError)
              return Text('error:${snapshot.error}');
            return Text('Result: ${snapshot.data}');
        }
        return null;
      },
    );
  }
}

class ImageView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Image.asset('lib/assets/1.jpg');
  }
}

class BoxView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: new BoxDecoration(
        image: new DecorationImage(
            image: new AssetImage("lib/assets/1.jpg"),
        ),
      ),
      position: DecorationPosition.background,
      child: Container(
        padding: EdgeInsets.all(50.0),
        child: Container(
          width: 10.0,
          height: 10.0,
          child: Center(
            child: new Text("ppppp"),
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FlatButton(
        onPressed: () {
          debugDumpRenderTree();
        },
        child: new Text("按钮")
    );
  }
}