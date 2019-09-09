import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class OtherRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    print(args);
    return Scaffold(
      appBar: AppBar(
        title: Text("Other"),
      ),
      body: Center(
        child: RandomWordsWidget(),
      ),
    );
  }
}

class RandomWordsWidget extends StatefulWidget {
  RandomWordsWidget({Key key}) : super(key: key);
    @override
    _RandomWordsWidgetState createState() => new _RandomWordsWidgetState();
}

class _RandomWordsWidgetState extends State<RandomWordsWidget> {
  String pp;
  void _change() {
    setState(() {
      pp = new WordPair.random().toString();;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Text('$pp'),
        new FlatButton(
            onPressed: _change,
            child: new Text("按钮")
        )
      ],
    );
  }
}