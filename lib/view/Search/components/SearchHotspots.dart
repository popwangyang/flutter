import 'package:flutter/material.dart';
import 'listContent.dart';

class Hotspots extends StatelessWidget{

  Hotspots({Key key, this.list}):super(key: key);

  final List list;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListContent(list: list,);
  }
}


