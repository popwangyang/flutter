import 'package:flutter_app/view/newRoute.dart';
import 'package:flutter_app/view/otherPage.dart';
import 'package:flutter_app/view/CounterWidget.dart';

final routes = {
  "new_page":(context) => NewRoute(),
  "new_page1":(context) => OtherRoute(),
  "new_page2":(context) => CounterWidget(initValue: 10),
};