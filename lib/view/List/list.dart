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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Listener(
      child: Container(
        color: Colors.yellow,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          child: SizedBox(
            height: y,
            child: Text("pppp"),
          ),
          padding: EdgeInsets.only(top: y),
        ),
      ),
      onPointerDown: (PointerEvent e) => _down(e),
      onPointerMove: (PointerEvent e) => _move(e),
      onPointerUp: (PointerEvent e) => _up(e),
    );
  }

  double start;
  double x;
  double y = 0;
  final double a = 300;
  final double b = 0.5;


  _down(e){
    start = e.position.dy;
  }

  _move(e){
    x = e.position.dy - start;
//    print(x);
    _getY();
  }

  _up(e){
    print(e);
  }

  _getY(){
    y = a * x  /  (a/2 + x );
    setState(() {

    });

    print(y);
  }

}

