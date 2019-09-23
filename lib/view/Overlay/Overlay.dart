import 'package:flutter/material.dart';



class Toast {
  static void show({@required BuildContext context ,@required String messgae}){

    OverlayEntry overlayEntry = new OverlayEntry(builder: (context){
      return new Positioned(
          top: MediaQuery.of(context).size.height * 0.7,
          child: new Material(
            child: new Container(
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

class OverlayDome extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Overlay"),
      ),
      body: Center(
        child: FlatButton(
          color: Colors.yellow,
          child: Text("按钮"),
          onPressed:(){
            _btn();
          },
        ),
      ),
    );
  }

  _btn() {
    Toast.show(messgae: "mmmmmm");
  }
}




