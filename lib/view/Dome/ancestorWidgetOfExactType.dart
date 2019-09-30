import 'package:flutter/material.dart';

class Foo extends StatefulWidget {
  @override
  _FooState createState() => _FooState();
}

class _FooState extends State<Foo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ancestorWidgetOfExactType断言"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Goo(),
              Hoo(
                child: Column(
                  children: <Widget>[
                    WidgetD(),
                    WidgetE(),
                    WidgetF()

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Goo extends StatefulWidget {

  final _GooState state = _GooState();

  @override
  _GooState createState() {
    return state;
  }
}

class _GooState extends State<Goo> {

  int counter = 10;

  void add(){

    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    assert(
      context.ancestorWidgetOfExactType(Text) == null,  // 其获取的父组件是所以有的祖先组件
      'Goo的父组件不能是Center'
    );
    return Container(
      child: Column(
        children: <Widget>[
          WidgetA(),
          WidgetC(),
        ],
      ),
    );
  }
}

class WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Goo widget = context.ancestorWidgetOfExactType(Goo);
    final _GooState state = widget?.state;

    return Container(
      child: Text('${state == null ? 0: state.counter}'),
    );
  }
}

class WidgetC extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final Goo widget = context.ancestorWidgetOfExactType(Goo);
    final _GooState state = widget?.state;


    return RaisedButton(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Text("点击"),
            ],
          ),
        ),
      ),
      onPressed: (){
        state?.add();
      },
    );
    }
  }


  // 另一种场景；
class Hoo extends StatefulWidget {

  final Widget child;

  Hoo({Key key, this.child}): super(key: key);

  final _HooState state = _HooState();

  @override
  _HooState createState(){
    return state;
  }

  static _HooState of(BuildContext context){
    Hoo widget = context.ancestorWidgetOfExactType(Hoo);

    return widget.state;
//    return (context.ancestorWidgetOfExactType(Hoo) as Hoo).state;
  }
}


class Item{

  String aa;

  Item(this.aa);
}

class _HooState extends State<Hoo> {

  List<Item> data =  <Item>[];

  int get dataLength => data.length;

  void add(){
    setState(() {
      data.add(Item('ppp'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class WidgetD extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final state = Hoo.of(context);

    return Container(
      child: Text("${state.dataLength}"),
    );
  }
}

class WidgetE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Hoo.of(context);
    return RaisedButton(
      child: Text("点击"),
      onPressed: (){
        state.add();
      },
    );
  }
}

class WidgetF extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("WidgetE"),
    );
  }
}










