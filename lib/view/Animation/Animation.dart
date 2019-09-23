import 'package:flutter/material.dart';

class AnimationPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter动画'),
      ),
      body: FooAnimation(),
    );
  }
}


class FooAnimation extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FooAnimationState();
  }
}

class _FooAnimationState extends State<FooAnimation> with SingleTickerProviderStateMixin{

  Animation<double> animation;
  
  AnimationController controller;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(
        vsync: this, 
        duration: Duration(seconds: 3)
    );
    animation = CurvedAnimation(parent: controller, curve:  Curves.bounceIn);
    animation = Tween(begin: 0.0, end: 300.0).animate(animation);
    animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        controller.reverse();
      }else if(status == AnimationStatus.dismissed){
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GrowTranstion(
      child: Container(
        color: Colors.redAccent,
      ),
      animation: animation,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}

class AnimateBox extends AnimatedWidget{
  AnimateBox({Key key, Animation<double> animation})
      : super (key: key, listenable: animation);

  Widget build(BuildContext context){
    final Animation<double> animation = listenable;
    return new Center(
      child: Container(
        width: animation.value,
        height: animation.value,
        color: Colors.blue,
      ),
    );
  }
}

class GrowTranstion extends StatelessWidget{

  GrowTranstion({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context){
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget child){
        return Container(
          height: animation.value,
          width: animation.value,
          child: child,
        );
      },
      child: child,
    );
  }
}