import 'package:flutter/material.dart';
import 'package:flutter_app/util/utils.dart';

class ListContent extends StatelessWidget{

  ListContent({Key key, this.list, this.showClose = false, this.closeBtn, this.lastWidget}):super(key:key);

  final List list;
  final bool showClose;
  final ValueChanged<int> closeBtn;
  final Widget lastWidget;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Map> data = transformData(list: list);
    return Column(
      children: <Widget>[
        Column(
          children: data.map((e){
            return  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Item(value: e['value1'], showClose: showClose, closeBtn: closeBtn,),
                Separator(),
                e['value2']['text'] == '' ? Expanded(flex: 1, child: lastWidget,) : Item(value: e['value2'], showClose: showClose, closeBtn: closeBtn,),
              ],
            );
          }).toList(),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0,bottom: 20.0),
          child: Divider(
              height: 1.0,
              color: Colors.grey
          ),
        )
      ],
    );
  }

}



class Item extends StatelessWidget{

  Item({Key key, this.value, this.showClose, this.closeBtn}):super(key:key);
  final Map value;
  final bool showClose;
  final ValueChanged<int> closeBtn;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Expanded(
        flex: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 1,
              child:  Container(
//                padding: EdgeInsets.only(left: 10, right: 10),
                margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  child: Text(value['text'],
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            Offstage(
              offstage: value['text'] != '' ? !showClose:true,
              child:  InkWell(
                child: Icon(Icons.close, size: 20.0, color: Colors.grey,),
                onTap: _closeBtn,
              ),
            )
          ],
        )
    );
  }

 void _closeBtn(){
    closeBtn(value['index']);
  }
}


// 竖杠分隔符;
class Separator extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      width: 0.5,
      height: 16,
      color: Colors.grey,
      margin: EdgeInsets.only(left: 10, right: 26),
    );
  }
}