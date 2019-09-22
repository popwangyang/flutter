import 'package:flutter/material.dart';

class ListPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ppp'),
        backgroundColor: Colors.red,
      ),
      body: MyListPage(),
    );
  }
}

class MyListPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyListPageState();
  }
}

class _MyListPageState extends State<MyListPage>{
  
  List list = new List();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  
  Future getData() async {
    await Future.delayed(Duration(seconds: 2), (){
      setState(() {
        list = List.generate(15, (i){
          return '哈喽,我是原始数据 $i';
        });
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
        itemBuilder: _renderRow,
        itemCount: list.length,
      ),
    );
  }

  Widget _renderRow(BuildContext context, index) {
    return ListTile(
      title: Text(list[index]),
    );
  }

  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 3), () {
      print('refresh');
      setState(() {
        list = List.generate(20, (i) => '哈喽,我是新刷新的 $i');
      });
    });
  }
}

