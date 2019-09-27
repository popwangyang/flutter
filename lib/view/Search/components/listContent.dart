import 'package:flutter/material.dart';
import 'package:flutter_app/util/utils.dart';

class ListContent extends StatelessWidget{

  ListContent({
    Key key,
    this.list,
    this.showClose = false,
    this.closeBtn,
    this.lastWidget,
    this.lastBtn
  }):super(key:key);

  final List<Map> list;
  final bool showClose;
  final ValueChanged<int> closeBtn;
  final ValueChanged<bool> lastBtn;
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
                e['value2']['text']['value'] == '' && lastWidget!= null ?
                 Expanded(
                   flex: 1,
                   child: InkWell(
                     child: lastWidget,
                     onTap: _lastBtn,
                   ),
                 ) : Item(value: e['value2'], showClose: showClose, closeBtn: closeBtn,),
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

  void _lastBtn(){
    if(lastBtn != null){
      lastBtn(false);
    }
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
                margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  child: Text(value['text']['value'],
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
              offstage: value['text']['type'] != '1',
              child: Container(
                width: 14.0,
                height: 14.0,
                decoration: BoxDecoration(
                   color: Colors.blue,
                   borderRadius: BorderRadius.circular(3.0)
                ),
                child: Center(
                  child: Text("推",style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white
                  ),),
                )
              ),
            ),
            Offstage(
              offstage: value['text']['type'] != '2',
              child: Container(
                width: 14.0,
                height: 14.0,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(3.0)
                ),
                child: Center(
                  child: Text("热",style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white
                  ),),
                )
              ),
            ),
            Offstage(
              offstage: value['text']['value'] != '' ? !showClose:true,
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
    print(value);
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