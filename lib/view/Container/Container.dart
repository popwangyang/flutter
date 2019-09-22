import 'package:flutter/material.dart';
import 'package:flutter_app/components/header.dart';
import 'package:flutter_app/components/Box.dart';
import 'package:flutter_app/components/bottomBar.dart';
import 'package:flutter_app/components/fonts.dart';


class ContainerPage extends StatelessWidget{

  void btn(e){
    print(e);
  }

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
      },
      {
        'title': '长达两个小时的魔幻动作片中,唯一一部一次连看两遍的片子',
        'hot': '0',
        'source': '全球影视基地',
        'CommentNumber': '109',
        'type': '2',
        'urlSrc1': 'lib/assets/4.jpg',
        'urlSrc2': 'lib/assets/5.jpg',
        'urlSrc3': 'lib/assets/6.jpg',
      },
      {
        'title': '长达两个小时的魔幻动作片中,唯一一部一次连看两遍的片子',
        'hot': '0',
        'source': '全球影视基地',
        'CommentNumber': '109',
        'type': '3',
        'urlSrc': 'lib/assets/4.jpg',
      },
    ];
    const list = ['0', '1', '2'];
    return Scaffold(
      body: Column(
        children: <Widget>[
          Header(),
          Expanded(
            child: Scrollbar(
              child: SingleChildScrollView(
                child:  Column(
                  children: data.map((e){
                    if(list.indexOf(e['type']) > -1){
                      return Box(obj: e);
                    }else{
                      return BoxRow(obj: e);
                    }
                  }).toList(),
                ),
              ),
            ),
          ),
          Container(
            height: 50.0,
            child: BottomBar(
              iconList: <IconData>[
                MyIcons.home,
                MyIcons.search,
                MyIcons.player
              ],
              selectIndex: 1,
              btn: btn,
            ),
          )
        ],
      )
    );
  }
}