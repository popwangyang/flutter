import 'package:flutter/material.dart';


class BottomBar extends StatefulWidget{

  BottomBar({Key key, this.selectIndex = 1, this.iconList, this.btn}): super(key: key);

  final int selectIndex;
  final List<IconData> iconList;
  final ValueChanged btn;

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar>{
  int _selectIndex;

  @override
  void initState() {
    super.initState();
    print(widget.selectIndex);
    setState(() {
      _selectIndex = widget.selectIndex;
    });
  }

  void _tap(e){
    widget.btn(e);
    setState(() {
      _selectIndex = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: widget.iconList.map((e){
        var index = widget.iconList.indexOf(e) + 1;
        return IconBtn(
          iconName: e,
          isSelected: index == _selectIndex ? true:false,
          onTab:_tap,
          index: index,
        );
      }).toList(),
    );
  }

}

class IconBtn extends StatelessWidget{

  IconBtn({Key key, this.isSelected = true, this.iconName, this.onTab, this.index}) : super(key: key);

  final int index;
  final bool isSelected;
  final IconData iconName;
  final ValueChanged onTab;

  void _taps(){
    onTab(index);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      flex: 1,
      child: Center(
        child:  Container(
          child: FlatButton(
            child: Column(
              children: <Widget>[
                Icon(
                  iconName,
                  color: isSelected ? Colors.red: Colors.black,
                  size: 30.0,
                ),
                Text("首页",
                  style: TextStyle(
                    fontSize: 10.0,
                    color: isSelected ? Colors.red: Colors.black,
                  ),
                )
              ],
            ),
            onPressed: _taps,
          )
        ),
      )
    );
  }
}