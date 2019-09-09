import 'package:flutter/material.dart';
import 'package:flutter_app/view/myHomePage.dart';
import 'package:flutter_app/router/router.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      initialRoute:"/", //名为"/"的路由作为应用的home(首页)
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      //注册路由表
      routes: routes,
      home: new MyHomePage(title: 'Flutter Demo Home Page'), 
      onGenerateRoute: (RouteSettings settings){
        WidgetBuilder builder;
        print(settings.name);
        return MaterialPageRoute(builder: (context) {
          return new MyHomePage(title: 'Flutter Demo Home Page');
        });
      }
    );
  }
}

