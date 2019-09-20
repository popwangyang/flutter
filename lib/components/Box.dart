import 'package:flutter/material.dart';
import 'package:flutter_app/components/fonts.dart';

class Box extends StatelessWidget{
  Box({Key key, @required this.obj}) : super(key: key);
  final Map obj;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextTitle(title: obj["title"]),
            (){
              if(obj['type'] == '0'){
                return Container();
              }else if(obj['type'] == '1'){
                return VideoPlayer(obj: obj);
              }else{
                return ImageBox(obj: obj);
              }
            }(),
            TextSubheading(item: obj),
            Dividers(),
          ],
        )
    );
  }
}

class BoxRow extends StatelessWidget {
  BoxRow({Key key, @required this.obj}): super(key: key);

  final Map obj;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Container(
            height: 90.0,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 6.0),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: TextTitle(title: obj['title']),
                          ),
                        ),
                        TextSubheading(item: obj),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 120,
                  height: 90.0,
                  child: Image(
                      image: AssetImage(obj['urlSrc']),
                      fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
          Dividers()
        ],
      )
    );
  }
}


// 组件标体
class TextTitle extends StatelessWidget{

  TextTitle({Key key, @required this.title}):super(key: key);

  final title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(bottom: 4.0),
      child: Text(title,
        textAlign: TextAlign.left,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
// 下划线类

class Dividers extends StatelessWidget{
  Dividers({Key key, this.height = 1.0, this.color = Colors.grey}): super(key: key);

  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(top: 4.0),
      child: Divider(
        height: 1.0,
        color: Colors.grey,
      ),
    );
  }
  
}


// 组件的副标题

class TextSubheading extends StatelessWidget{

  TextSubheading({Key key, @required this.item}):super(key: key);

  final Map item;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 4.0),
      child:  Row(
        children: <Widget>[
          Offstage(
            offstage: item['hot'] == '1' ? false:true,
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Text("置顶",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Text(item['source'],
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Text(item['CommentNumber'] + "评论",
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                alignment: Alignment(1.0, 0),
                child: Opacity(
                  opacity: item['hot'] == '1' ? 0.0:1.0,
                  child: Container(
                    padding: EdgeInsets.only(top: 1.0, bottom: 1.0, left: 4.0, right: 4.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                            style: BorderStyle.solid
                        ),
                        borderRadius: BorderRadius.circular(4.0)
                    ),
                    child: Icon(
                      MyIcons.close,
                      color: Colors.grey,
                      size: 8.0,
                    ),
                  ),
                )
            ),
          )
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
            margin: EdgeInsets.only(top: 0.0),
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

// 图片框；

class ImageBox extends StatelessWidget{

  ImageBox({Key key, @required this.obj}): super(key: key);

  final Map obj;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Flex(
        direction: Axis.horizontal,

        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(right: 1.0),
              child: Image(
                image: AssetImage(obj['urlSrc1']),
                fit: BoxFit.fitHeight,
              ),
            )
          ),
          Expanded(
              flex: 1,
              child:  Container(
                margin: EdgeInsets.only(left: 1.0, right: 1.0),
                child: Image(
                  image: AssetImage(obj['urlSrc2']),
                  fit: BoxFit.fitHeight,
                ),
              )
          ),
          Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 1.0),
                child: Image(
                  image: AssetImage(obj['urlSrc3']),
                  fit: BoxFit.fitHeight,
                ),
              )
          )
        ],
      )
    );
  }
}