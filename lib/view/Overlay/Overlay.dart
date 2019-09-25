import 'package:flutter/material.dart';



class Toast {
  static void show({@required BuildContext context ,@required String messgae}){

    OverlayEntry overlayEntry = new OverlayEntry(builder: (context){
      return new Positioned(
          top: kToolbarHeight,
          right: 10,
          width: 200,
          height: 280,
          child: new SafeArea(
          child: new Material(
          child: new Container(
          color: Colors.black,
          child: new Column(
          children: <Widget>[
          Expanded(
          child: new ListTile(
          leading: Icon(
          Icons.add,
          color: Colors.white,
      ),
      title: new Text(
      "发起群聊",
      style: TextStyle(color: Colors.white),
      ),
      ),
      ),
      Expanded(
      child: new ListTile(
      leading: Icon(Icons.add, color: Colors.white),
      title: new Text("添加朋友",
      style: TextStyle(color: Colors.white)),
      ),
      ),
      Expanded(
      child: new ListTile(
      leading: Icon(Icons.add, color: Colors.white),
      title: new Text("扫一扫",
      style: TextStyle(color: Colors.white)),
      ),
      ),
      Expanded(
      child: new ListTile(
      leading: Icon(Icons.add, color: Colors.white),
      title: new Text("首付款",
      style: TextStyle(color: Colors.white)),
      ),
      ),
      Expanded(
      child: new ListTile(
      leading: Icon(Icons.add, color: Colors.white),
      title: new Text("帮助与反馈",
      style: TextStyle(color: Colors.white)),
      ),
      ),
      ],
      ),
      ),
      )));
    });

    Overlay.of(context).insert(overlayEntry);

    Future.delayed(Duration(seconds: 2)).then((value){
//      overlayEntry.remove();
    });
  }
}

class OverlayDome extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Overlay"),
      ),
      body: Center(
        child: GestureDetector(
          child: Container(
            child: Text("点击"),
          ),
          onTap: () => _btn(context),
        )
        ,
      ),
    );
  }

  void _btn(context) {
    Toast.show(context:context,messgae: "mmmmmm");
  }
}




