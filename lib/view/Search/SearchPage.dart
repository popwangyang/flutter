import 'package:flutter/material.dart';

import 'components/searchTitle.dart';

import 'package:flutter_app/commint/ValueNotifier.dart';

import 'components/SearchHotspots.dart';

import 'package:flutter_app/util/utils.dart';

import 'components/SearchHistory.dart';

import 'components/SearchApplets.dart';

import 'components/SearchRecommend.dart';


class Search extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchState();
  }
}

class _SearchState extends State<Search> {

  bool isFocus = true;

  ValueNotifierData vn = ValueNotifierData('');

  List<Map> dataList = [
    {
      'value': '阿里的第一颗芯片',
      'type': '0',
    },
    {
      'value': '去欧洲旅行攻略',
      'type': '0',
    },
    {
      'value': '火星勘测到生命物质',
      'type': '0',
    },
    {
      'value': '魔兽世界怀旧服持续火爆是是是',
      'type': '0',
    }
  ];



  List<Map> historyList = [
    {
      'value': '收割机的制造原理',
      'type': '0',
    },
    {
      'value': '书院的收费制度',
      'type': '0',
    },
    {
      'value': '水源KTV暴力事件',
      'type': '0',
    },
    {
      'value': '教官带千名学生蹦迪',
      'type': '0',
    },
    {
      'value': '收割机的制造原理',
      'type': '0',
    },
    {
      'value': '法国奶豹逛街被抓',
      'type': '0',
    },
    {
      'value': '阿里的第一颗芯片',
      'type': '0',
    },
    {
      'value': '去欧洲旅行攻略',
      'type': '0',
    },
    {
      'value': '收割机的制造原理',
      'type': '0',
    },
    {
      'value': '法国奶豹逛街被抓',
      'type': '0',
    },
    {
      'value': '阿里的第一颗芯片',
      'type': '0',
    },
    {
      'value': '去欧洲旅行攻略',
      'type': '0',
    }
  ];
  List<Map> appletsData = [
    {
      'title': '一块小红心',
      'url': 'lib/assets/1.jpg'
    },
    {
      'title': '一块小红心',
      'url': 'lib/assets/2.jpg'
    },
    {
      'title': '一块小红心',
      'url': 'lib/assets/6.jpg'
    },
    {
      'title': '一块小红心',
      'url': 'lib/assets/4.jpg'
    },
    {
      'title': '一块小红心',
      'url': 'lib/assets/5.jpg'
    },
  ];

  List<Map> recommendList = [
    {
      'value': '法国奶豹逛街被抓',
      'type': '0',
    },
    {
      'value': '水源KTV暴力事件',
      'type': '1',
    },
    {
      'value': '书院的收费制度',
      'type': '0',
    },
    {
      'value': '旱瀨介绍',
      'type': '2',
    },
    {
      'value': '周杰伦MV被纠错',
      'type': '0',
    },
    {
      'value': '无敌小肥猪电影',
      'type': '1',
    },
    {
      'value': '成都地标亮灯迎国庆',
      'type': '0',
    },
    {
      'value': '阅兵方队一步不差',
      'type': '2',
    },
    {
      'value': '十大打算打打的',
      'type': '2',
    }
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SearchContext(isFocus: isFocus, vn: vn),
        backgroundColor: Colors.red,
        titleSpacing: 0.0,
      ),
      body: Listener(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Scrollbar(
            child: SingleChildScrollView(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  children: <Widget>[
                    Hotspots(list: dataList),
                    HistoryRecode(historyList: historyList,),
                    AppletsList(listData: appletsData,),
                    Recommend(data: recommendList,),
                  ],
                ),
            ),
          ),
        ),
        onPointerDown: (onPointerDown){
          vn.value = getRandomNumber();
        },
        behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
      )
    );
  }
}


