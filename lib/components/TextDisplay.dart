import 'package:flutter/material.dart';
import 'package:flutter_app/components/fonts.dart';

class TextDisplay extends StatelessWidget{

  TextDisplay({Key key, @required this.obj, }):super(key: key);

  final Map obj;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextTitle(title: obj["title"],),
          TextSubheading(item: obj),
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
    return Text(title,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        ),
    );
  }
}

// 组件的副标题

class TextSubheading extends StatelessWidget{

  TextSubheading({Key key, @required this.item, this.visible = false}):super(key: key);

  final Map item;
  final bool visible;

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
                  opacity: visible ? 1.0:0.0,
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


