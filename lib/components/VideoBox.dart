import 'package:flutter/material.dart';
import 'package:flutter_app/components/fonts.dart';
import 'package:flutter_app/components/TextDisplay.dart';

class VideoBox extends StatelessWidget{

  VideoBox({Key key, @required this.obj}) : super(key:key);
  final Map obj;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
      child: Column(
        children: <Widget>[
          TextTitle(title: obj['title']),
          VideoPlayer(obj: obj),
          TextSubheading(item: obj, visible: true,)
        ],
      ),
    );
  }
}

// video播放器；
class VideoPlayer extends StatelessWidget{
  VideoPlayer({Key key, @required this.obj}): super(key:key);
  final Map obj;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(top: 4.0),
            height: 200.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(obj['urlSrc']),
                  fit: BoxFit.contain
              )
            ),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  child: Opacity(
                      opacity: 0.5,
                      child: Icon(
                        MyIcons.player,
                        color: Colors.black,
                        size: 46.0,
                      ),
                  )
                ),
                Positioned(
                  bottom: 20.0,
                  right: 10.0,
                  child: Container(
                    padding: EdgeInsets.only(top: 4.0, bottom: 4.0, left: 8.0, right: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color:  Colors.black38,
                    ),
                    child: Text(
                      obj['time'],
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.white,
                      ),
                    ),
                  )
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}