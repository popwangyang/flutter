import 'package:flutter/material.dart';


class Overlay1{

  static MyOverlay show1({
    BuildContext context,
    Color color = Colors.black26,
    Widget child,
    GlobalKey key,
    double childWidth = 120.0,
  }){
    MyOverlay myOverlay = new MyOverlay(ctx:context, bg: color, child: child, key: key, childWidth: childWidth);
    myOverlay.show();
    return myOverlay;
  }
}


class MyOverlay {


  MyOverlay({this.ctx, this.bg, this.child, this.key, this.childWidth}):super();

  OverlayEntry entry;

  Color bg;  // 背景颜色；

  BuildContext ctx; // 执行上下文；

  Widget child;

  GlobalKey key;  // 点击元素的GlobalKey值

  double _left = 10.0;

  double _top;

  double childWidth;  // 弹出框的宽度
  

  void show(){

    entry = createOverlay();
    Overlay.of(ctx).insert(entry);
    this._getPositions();

  }

  _getPositions(){
    final RenderBox renderBoxRed = key.currentContext.findRenderObject();
    final sizeRed = renderBoxRed.size;
    final positionRed = renderBoxRed.localToGlobal(Offset.zero);
    this._left = positionRed.dx + sizeRed.width/2  - childWidth + 20.0 ;
    this._top = positionRed.dy + sizeRed.height + 0;
  }

  void remove(){
    entry.remove();
  }

  void btn(){
    print('ppppp');
  }

  OverlayEntry createOverlay(){
    OverlayEntry entry = OverlayEntry(
      builder: (ctx){
        return GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(ctx).size.width,
                height: MediaQuery.of(ctx).size.height,
                color: bg,
              ),
              Positioned(
                top: _top,
                left: _left,
                width: childWidth,
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 1.0
                      )
                    ],
                    color: Colors.black26,
                  ),
                  child: child,
                ),
              ),
            ],
          ),
          onTap: remove,
        );
      }
    );
    return entry;
  }
}