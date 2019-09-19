import 'package:flutter/material.dart';
import 'package:flutter_app/components/header.dart';
import 'package:flutter_app/components/TextDisplay.dart';
import 'package:flutter_app/components/VideoBox.dart';

class ContainerPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    const Map<String, String> Obj = {
      'title': '习近平：谱写新时代中原更加出彩的绚丽篇章',
      'hot': '1',
      'source': '央视网新闻',
      'CommentNumber': '962'
    };
    const List<Map> data = [
      {
        'title': '习近平：谱写新时代中原更加出彩的绚丽篇章',
        'hot': '1',
        'source': '央视网新闻',
        'CommentNumber': '962',
        'type': '0',
      },
      {
        'title': '习近平：谱写新时代中原更加出彩的绚丽篇章',
        'hot': '1',
        'source': '央视网新闻',
        'CommentNumber': '961',
        'type': '0',
      },
      {
        'title': '长达两个小时的魔幻动作片中,唯一一部一次连看两遍的片子',
        'hot': '0',
        'source': '全球影视基地',
        'CommentNumber': '109',
        'type': '1',
        'urlSrc': 'lib/assets/2.jpg',
        'time': '20:00'
      }
    ];
    return Scaffold(
      appBar: new AppBar(
        title: Text('Container容器'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Header(),
          Column(
            children: data.map((e){
              if(e['type'] == '0'){
                return TextDisplay(obj: e);
              }else{
                return VideoBox(obj: e);
              }
            }).toList(),
          )
        ]
      )
    );
  }
}