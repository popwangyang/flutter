import 'package:flutter/material.dart';
import 'listContent.dart';

class HistoryRecode extends StatefulWidget{

  HistoryRecode({Key key, this.historyList}): super(key: key);

  final List<Map> historyList;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HistoryRecodeState();
  }
}

class _HistoryRecodeState extends State<HistoryRecode>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (){
        if(showHistoryData.length > 0){
          return Column(
            children: <Widget>[
              DefaultTextStyle(
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        child: InkWell(
                          child: Row(
                            children: <Widget>[
                              Text("历史记录"),
                              Visibility(
                                visible: deleteFlag,
                                child: Icon(iconFlag ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up, size: 16.0, color: Colors.grey,),
                              )
                            ],
                          ),
                          onTap: _historyBtn,
                        )
                    ),
                        (){
                      if(deleteFlag){
                        return InkWell(
                          child: Icon(Icons.delete, size: 16.0, color: Colors.grey,),
                          onTap: _deleteBtn,
                        );
                      }else{
                        return Row(
                          children: <Widget>[

                            Padding(
                              padding: EdgeInsets.only(right: 20.0),
                              child: GestureDetector(
                                  child: Text("全部删除"),
                                  onTap: _deleteAllBtn,
                              ),
                            ),
                            GestureDetector(
                              child: Text("完成"),
                              onTap: _completeBtn,
                            ),
                          ],
                        );
                      }
                    }()
                  ],
                ),
              ),
              ListContent(list: showHistoryData, showClose: !deleteFlag, closeBtn: _closeBtn,)
            ],
          );

        }else{
          return Container();
        }
      }();
  }

  bool iconFlag = true;
  bool deleteFlag = true;
  List<Map> showHistoryData;

  @override
  void initState() {
    // TODO: implement initState
    _init();
    super.initState();
  }

  void _init(){
    _setDisplayData();
  }

  void _setDisplayData(){

    if(widget.historyList.length > 6 && iconFlag && deleteFlag){
      showHistoryData = widget.historyList.sublist(0, 6);
    }else{
      showHistoryData = widget.historyList;
    }
  }

  void _historyBtn(){
    if(deleteFlag){
      setState(() {
        iconFlag = !iconFlag;
        _setDisplayData();
      });
    }
  }

  // 删除操作按钮
  void _deleteBtn(){
    setState(() {
      deleteFlag = !deleteFlag;
      _setDisplayData();
    });
  }

  // 操作完成按钮
  void _completeBtn(){
    setState(() {
      deleteFlag = true;
      _setDisplayData();
    });
  }

  // 删除单条数据按钮
  void _closeBtn(int index){
    setState(() {});
    widget.historyList.removeAt(index);
  }

  // 删除全部；
  void _deleteAllBtn(){
    setState(() {});
   widget.historyList.clear();
  }

}