import 'package:flutter/material.dart';

class GridPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
//              _gridView1(),
//              _gridView2(),
              _gridView3(),
          ],
        ),
    )
    );
  }

  TextStyle titleStyle = TextStyle(
    color: Colors.black,
    fontSize: 24.0
  );
  List<String> _getDataList() {
    List<String> list = [];
    for(int i = 0; i < 100; i++){
      list.add(i.toString());
    }
    return list;
  }
  List<Widget> _getWidgetList() {
    return _getDataList().map((item) => _getItemContainer(item)).toList();
  }
  Widget _getItemContainer(String item) {
    return Container(
      alignment: Alignment.center,
      height: 20,
      width: 30,
      child: Text(
        item,
        style: TextStyle(
            color: Colors.white,
            fontSize: 10
        ),
      ),
      color: Colors.blue,
    );
  }

  Widget _gridView1(){
    return Container(

      child: Column(
        children: <Widget>[
          Text("GridView.count", style: titleStyle,),
          Container(
            height: 200.0,
            child: GridView.count(
              crossAxisCount: 5,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              padding: EdgeInsets.all(10.0),
              childAspectRatio: 2.0,
              children: _getWidgetList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _gridView2() {
    return Container(
      child: Column(
        children: <Widget>[
          Text("GridView,builder1", style: titleStyle,),
          Container(
            height: 200.0,
            child: GridView.builder(
                itemCount: _getDataList().length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 2.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return _getItemContainer(_getDataList()[index]);
                }
            ),
          )
        ],
      ),
    );
  }

  Widget _gridView3() {
    return Container(
      child: Column(
        children: <Widget>[
          Text('GridView.builder2', style: titleStyle,),
          Container(
            height: 200.0,
            child: GridView.builder(
                itemCount: _getDataList().length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 20,
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 10.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return _getItemContainer(_getDataList()[index]);
                }
            ),
          )
        ],
      ),
    );
  }
}