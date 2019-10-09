import 'package:flutter/material.dart';
import 'package:flutter_app/view/index.dart';
import 'package:flutter_app/router/router.dart';
import 'package:flutter_app/store/counter.dart';
import 'package:flutter_app/store/state.dart';
import 'package:flutter_app/store/translation.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
          Provider(builder: (context) => CounterNotifier()),
//        ChangeNotifierProvider.value(value: CounterNotifier()),
//        ChangeNotifierProvider.value(value: StateNotifier()),
//        ProxyProvider<CounterNotifier, Translations>(
//          builder: (context, counterNotifier, previous) => Translations(counterNotifier.count),
//        )
      ],
      child: new MaterialApp(
          title: 'Flutter Demo',
          initialRoute:"/", //名为"/"的路由作为应用的home(首页)
          theme: new ThemeData(
            primarySwatch: Colors.blue,
          ),
          //注册路由表
          routes: routes,
          home: new IndexPage(),
          onGenerateRoute: (RouteSettings settings){
            WidgetBuilder builder;
            return MaterialPageRoute(builder: (context) {
              return new IndexPage();
            });
          }
      ),
    );
  }
}

