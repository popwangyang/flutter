import 'package:flutter/material.dart';
import 'package:flutter_app/components/fonts.dart';

class BottomBar extends StatefulWidget{

  BottomBar({Key key, @required this.selectIndex}): super(key: key);

  final int selectIndex;

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar>{
  int _selectIndex;

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectIndex = widget.selectIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        IconBtn(),
        IconBtn(),
        IconBtn(),
        IconBtn()
      ],
    );
  }

}

class IconBtn extends StatelessWidget{

  IconBtn({Key key, this.isSelected = true}) : super(key: key);

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      flex: 1,
      child: Center(
        child:  Container(
          child: Column(
             children: <Widget>[
               Icon(
                 MyIcons.home,
                 color: isSelected ? Colors.red: Colors.black,
                 size: 32.0,
               ),
               Text("首页",
                style: TextStyle(
                  fontSize: 10.0,
                  color: isSelected ? Colors.red: Colors.black,
                ),
               )
             ],
          ),
        ),
      )
    );
  }
}