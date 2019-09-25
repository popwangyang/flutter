import 'package:flutter/material.dart';
import 'package:flutter_app/commint/ValueNotifier.dart';

class SearchContext extends StatefulWidget{

  SearchContext({Key key, this.isFocus = true, this.vn}):super(key: key);

  final bool isFocus;

  final ValueNotifierData vn;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchContext();
  }
}

class _SearchContext extends State<SearchContext> {

  TextEditingController _controller = TextEditingController();

  FocusNode _commentFocus = FocusNode();  // 焦点句柄

  bool display = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            child: Container(
               child: Icon(Icons.keyboard_arrow_left,size: 36.0),
            ),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: Colors.white
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 6.0),
                    child: Icon(Icons.search, size: 20, color: Colors.black,),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      height: 30.0,
                      child: TextField(
                        controller: _controller,
                        autofocus: widget.isFocus,
                        focusNode: _commentFocus,
                        style: TextStyle(
                          fontSize: 16.0,
                          decoration: TextDecoration.none
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(top: 10.0,),
                          hintText: "任天堂成立130周年",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Opacity(
                      opacity: display ? 1.0 : 0.0,
                      child: Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Container(
                            child: Icon(Icons.close, size: 12.0, color: Colors.black26,),
                            width: 16.0,
                            height: 16.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.black26,
                            ),
                          )
                      ),
                    ),
                    onTap: _clearInput,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Text("搜索",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal
                ),
              ),
            ),
            onTap: noFocus,
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    _controller.addListener((){
      this._inputChange(_controller.text);
    });
    widget.vn.addListener(_vnListener);
    super.initState();
  }

  void _inputChange(v) {
    setState(() {
      display = v.length > 0 ? true:false;
    });
  }

  void _clearInput(){
    _controller.text = '';
    this.noFocus();
  }

  void noFocus(){
    _commentFocus.unfocus();
  }

  void _vnListener(){
    this.noFocus();
  }
}