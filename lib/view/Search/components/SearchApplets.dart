import 'package:flutter/material.dart';

class AppletsList extends StatelessWidget{

  AppletsList({Key key, this.listData}):super(key: key);

  final List<Map> listData;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
        if(listData.length > 0){
          return  Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("头条小程序", style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),),
                  ],
                ),
              ),
              AppletContent(listData: listData,),
              Padding(
                child: Divider(
                  height: 1.0,
                  color: Colors.grey,
                ),
                padding: EdgeInsets.only(bottom: 20.0),
              )
            ],
          );
        }else{
          return Container();
        }
  }
}


class AppletContent extends StatelessWidget{

  AppletContent({Key key, this.listData}):super(key: key);

  final List<Map> listData;

  final ScrollPhysics _scrollPhysics = BouncingScrollPhysics();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Row(
          children: <Widget>[
            Container(
              child: Row(
                children: listData.map((e){
                  return AppletContentItem(item: e,);
                }).toList(),
              ),
            ),
            AppletContentMore(),
          ],
        ),
        scrollDirection: Axis.horizontal,
        physics: _scrollPhysics,
      ),
    );
  }
}

class AppletContentItem extends StatelessWidget{

  AppletContentItem({Key key, this.item}): super(key: key);

  final Map item;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 80.0,
      height: 80.0,
      padding: EdgeInsets.only(left: 6.0, right: 6.0),
      child: Column(
        children: <Widget>[
          Container(
            width: 40.0,
            height: 40.0,
            margin: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(color: Colors.grey, width: 1.0,),
              image: DecorationImage(
                  //图片填充方式
                  fit: BoxFit.cover,
                  image: ExactAssetImage(item['url']),
                ),

            ),
          ),
          Text(item['title'],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12.0
            ),)
        ],
      ),
    );
  }
}

class AppletContentMore extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 80.0,
      height: 80.0,
      padding: EdgeInsets.only(left: 6.0, right: 6.0),
      child: Column(
        children: <Widget>[
          Container(
            width: 40.0,
            height: 40.0,
            margin: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(color: Colors.grey, width: 1.0,),
              color: Colors.grey[80],
            ),
            child: Icon(Icons.more_horiz, size: 26.0, color: Colors.black,),
          ),
          Text('更多',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 12.0
            ),)
        ],
      ),
    );
  }
}