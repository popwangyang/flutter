import 'package:flutter/material.dart';

import 'components/searchTitle.dart';

import 'package:flutter_app/commint/ValueNotifier.dart';

import 'components/SearchHotspots.dart';

import 'package:flutter_app/util/utils.dart';


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

  List dataList1 = ['阿里的第一颗芯片', '去欧洲旅行攻略', '火星勘测到生命物质', '魔兽世界怀旧服持续火爆是是是'];

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
      body: Scrollbar(
        child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 6.0, right: 6.0),
            child: GestureDetector(
              child: Column(
                children: <Widget>[
                  Hotspots(list: dataList1),


                ],
              ),
              onTap: (){
                vn.value = getRandomNumber();
              },
            )
        ),
      )
    );
  }
}


