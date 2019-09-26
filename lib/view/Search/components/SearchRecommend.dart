import 'package:flutter/material.dart';
import 'listContent.dart';

class Recommend extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RecommendItem1();
  }
}

class RecommendItem1 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            child: Icon(Icons.remove_red_eye, color: Colors.grey, size: 18,),
            padding: EdgeInsets.only(right: 6.0),
          ),
          Text('查看全部推荐词', style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),)
        ],
      ),
    );
  }

}

class RecommendItem2 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListContent(lastWidget: _widget,);
  }

  final Widget _widget = Row(
    children: <Widget>[
      Icon(Icons.visibility_off, size: 18, color: Colors.grey,),
      Text("隐藏推荐词", style: TextStyle(
        fontSize: 12,
        color: Colors.grey,
      ),)
    ],
  );
}
