import 'package:flutter/material.dart';

class Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("inheritedwidget02"),
      ),
      body: Container(
        child: Foo(
          child: Column(
            children: <Widget>[
              WidgetA(),
              WidgetB(),
              WidgetC(),
            ],
          ),
        ),
      ),
    );
  }
}

class Foo extends StatefulWidget {

  Foo({Key key, this.child}):super(key: key);

  final Widget child;

  @override
  _FooState createState() => _FooState();

  static Inherited of([BuildContext context, bool rebuild = true]){
    return (
      rebuild?
          context.inheritFromWidgetOfExactType(Inherited):
          context.ancestorWidgetOfExactType(Inherited)
    );

  }

}

class _FooState extends State<Foo> {

  int counter = 0;

  void add(){

    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Inherited(
        child: widget.child,
        state: this,
        data: counter,
      ),
    );
  }
}

class Inherited extends InheritedWidget{

  final _FooState state;
  final Widget child;
  final int data;

  Inherited({@required this.child, this.data, this.state});

  @override
  bool updateShouldNotify(Inherited oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

}

class WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('WidgetA rebuild');
    final int data = Foo.of(context).state.counter;

    return Container(
      child: Text('data is $data'),
    );
  }
}


class WidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('WidgetB rebuild');
    return Container(
      child: Text("WidgetB"),
    );
  }
}

class WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _fooState = Foo.of(context, false).state;
    print('WidgetC rebuild');
    return Container(
      child: RaisedButton(
        child: Text("点击"),
        onPressed: (){
          _fooState.add();
        },
      ),
    );
  }
}


