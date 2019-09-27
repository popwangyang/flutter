import 'package:flutter/material.dart';

class PassValue extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PassValueState();
  }
}

class PassValueState extends State<PassValue>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("widget嵌套传值"),
      ),
      body: CountProvider(
        child: Box1(count: 222,),
        count: 200,
      ),
    );
  }
}

//countProvider类 提供count属性和child属性 用于与原widget相关联

class CountProvider extends InheritedWidget{
  final int count;
  final Widget child;

  CountProvider({this.count, this.child}):super(child:child);

  static CountProvider of(BuildContext context){
    return context.inheritFromWidgetOfExactType(CountProvider);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return false;
  }

}


class Box1 extends StatelessWidget{

  Box1({Key key, this.count}): super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Box1Child(count: count,),
    );
  }
}

class Box1Child extends StatelessWidget{

  Box1Child({Key key, this.count}): super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    int aa = CountProvider.of(context).count;
    return Text('$aa');
  }
}