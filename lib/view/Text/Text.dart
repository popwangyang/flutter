import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {

//  void _tapRecognizer(){
//    print('_tapRecognizer');
//  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: Text("文本及样式"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            new Text('pppppppp'),
            Text("Hello World",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.blue,
                height: 1.2,
                fontSize: 18.0,
                background: new Paint()..color=Colors.yellow,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed,
              ),
            ),
            Text("Hello world! I'm Jack. "*4,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text("Hello world",
              textScaleFactor: 1.5,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("带有padding10"),
            ),
            Text.rich(TextSpan(
              children: [
                TextSpan(
                  text: 'Home: '
                ),
                TextSpan(
                  text: "http://baidu.com",
                  style: TextStyle(
                    color: Colors.blue
                  ),
//                  recognizer: _tapRecognizer
                )
              ]
            ))


          ],
        ),
      ),
    );
  }
}