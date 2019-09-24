import 'package:flutter/material.dart';
import 'package:flutter_app/components/myOverlay.dart';
import 'package:flutter_app/components/fonts.dart';



class Toast {
  static void show({@required BuildContext context ,@required String messgae}){

    OverlayEntry overlayEntry = new OverlayEntry(builder: (context){
      return new Positioned(
          top: MediaQuery.of(context).size.height * 0.7,
          child: new Material(
            child: new Container(
              color: Colors.red,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: new Center(
                child: new Card(
                  child: new Padding(
                    padding: EdgeInsets.all(8),
                    child: new Text(messgae),
                  ),
                  color: Colors.grey,
                ),
              ),
            ),
          ));
    });

    Overlay.of(context).insert(overlayEntry);

    Future.delayed(Duration(seconds: 2)).then((value){
      overlayEntry.remove();
    });
  }
}

class OverlayDome extends StatefulWidget{




  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OverlayDomeState();
  }

}

class _OverlayDomeState extends State<OverlayDome>{

  bool statue;

  GlobalKey _key = GlobalKey();
  MyOverlay myOverlay;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Overlay"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text('点击'),
              onPressed: _btn,
            ),
            FlatButton(
              key: _key,
              child: Text("Overlay"),
              color: Colors.blue,
              onPressed: _press,
            )
          ],
        )
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    statue = true;
    super.initState();
  }

  void _btn() {
    print("btn");
    setState(() {
      statue = !statue;
    });
  }

  void _foo(int value) {
    print(value);
    myOverlay.remove();

  }

  void _press(){
    Widget a = Column(
      children: <Widget>[
        Item(
          icon: MyIcons.player,
          text: "视频播放",
          label: 1,
          onChange: _foo
        ),
        Item(
          icon: MyIcons.camera,
          text: "扫码付款",
          label: 2,
          onChange: _foo
        ),
        Item(
          icon: MyIcons.search,
          text: "收搜美容",
          label: 3,
          onChange: _foo
        ),
        Item(
          icon: MyIcons.home,
          text: "返回首页",
          label: 4,
          onChange: _foo
        ),
      ],
    );

    myOverlay = Overlay1.show1(context:context, child: a, key: _key, color: Colors.transparent);
  }
}

class Item extends StatelessWidget{

  Item({Key key, this.icon, this.text, this.label, this.onChange}): super(key: key);

  final IconData icon;

  final String text;
  final int label;

  final ValueChanged<int> onChange;


  void _btn(){
    onChange(label);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 22.0,
      margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
      child: GestureDetector(
        child: Row(
          children: <Widget>[
            Icon(icon, size: 18, color: Colors.white,),
            Expanded(
              flex: 1,
              child: Text(text,
                textAlign: TextAlign.right,
                style:  TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15.0,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
            )
          ],
        ),
        onTap: _btn,
      )
    );
  }


}






