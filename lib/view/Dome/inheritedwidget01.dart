import 'package:flutter/material.dart';


class InheritedWidgetConst  extends StatefulWidget {
  @override
  _InheritedWidgetConstState createState() => _InheritedWidgetConstState();
}

class _InheritedWidgetConstState extends State<InheritedWidgetConst> {

  int counter = 0;

  void _add(){
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidgetConst"),
      ),
      body: Container(
        child: Inherited(
          child: Column(
            children: <Widget>[
              const WidgetA(),
              const WidgetB(),
              const WidgetC(),
//              Dome1(
//                child1: Dome11(),
//                child2: Dome12(),
//              ),
            ],
          ),
          data: counter,
          state: this,
        ),
      ),
    );
  }
}

class Inherited extends InheritedWidget{

  final int data;
  final _InheritedWidgetConstState state;

  Inherited({this.data, @required Widget child, this.state}): super(child: child){

    print('Inherited constructer');
  }

  @override
  bool updateShouldNotify(Inherited oldWidget) {
    // TODO: implement updateShouldNotify
    bool result = oldWidget.data != this.data;

    return result;
  }

  static Inherited of([BuildContext context, bool rebuild = true]){
    return(rebuild?
      context.inheritFromWidgetOfExactType(Inherited):
      context.ancestorWidgetOfExactType(Inherited)
    );
  }

}

class WidgetA extends StatelessWidget {
  const WidgetA();

  @override
  Widget build(BuildContext context) {
    print('A Rebuild');
    int data = Inherited.of(context).data;

    return Container(
      child: Text('$data'),
    );
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB();
  @override
  Widget build(BuildContext context) {
    print('B Rebuild');
    return Container(
      child: Text("BBBBB"),
    );
  }
}

class WidgetC extends StatelessWidget {
  const WidgetC();

  @override
  Widget build(BuildContext context) {
    print('C Rebuild');
    _InheritedWidgetConstState state = Inherited.of(context, false).state;

    return Container(
      child: RaisedButton(
        child: Text("点击"),
        onPressed: (){
          state._add();
        },
      ),
    );
  }
}


class Dome1 extends StatefulWidget {

  final Widget child1;
  final Widget child2;

  Dome1({this.child1, this.child2});

  @override
  _Dome1State createState() => _Dome1State();
}

class _Dome1State extends State<Dome1> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          widget.child2,
          widget.child1,
          RaisedButton(
            child: Text("点击"),
            onPressed: (){
              setState(() {
                counter++;
              });
            },
          )
        ],
      ),
    );
  }
}

class Dome11 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Dome11 Rebuild');
    return Container(
      child: Text('Dome11'),
    );
  }
}

class Dome12 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Dome12 Rebuild');
    return Container(
      child: Text('Dome12'),
    );
  }
}













