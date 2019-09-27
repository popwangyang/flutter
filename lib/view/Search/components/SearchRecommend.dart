import 'package:flutter/material.dart';
import 'listContent.dart';


class Recommend extends StatefulWidget{

  Recommend({Key key, this.data}): super(key: key);

  final List<Map> data;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RecommendState();
  }
}
class RecommendState extends State<Recommend>{





  bool hideFlag = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(hideFlag){
      return RecommendItem2(data: widget.data, onChange: _btn,);
    }else{
      return RecommendItem1(onChange: _btn,);
    }
  }

  void _btn(bool flag){
    setState(() {
      hideFlag = flag;
    });
  }

}

class RecommendItem1 extends StatelessWidget{


  RecommendItem1({Key key, this.onChange}):super(key: key);

  final ValueChanged<bool> onChange;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      child: Center(
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
      ),
      onTap: _btn,
    );
  }

  void _btn(){
    onChange(true);
  }
}

class RecommendItem2 extends StatelessWidget{

  RecommendItem2({Key key, this.data, this.onChange}):super(key: key);

  final List<Map> data;
  final ValueChanged<bool> onChange;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListContent(list: data, lastWidget: _widget, lastBtn: _btn,);
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

  void _btn(bool flag){
    onChange(flag);
  }
}
