import 'package:flutter_app/view/Text/Text.dart';
import 'package:flutter_app/view/Container/Container.dart';
import 'package:flutter_app/view/List/list.dart';
import 'package:flutter_app/view/Animation/Animation.dart';
import 'package:flutter_app/view/Hero/Hero.dart';
import 'package:flutter_app/view/PopupMenuButton/PopupMenuButton.dart';
import 'package:flutter_app/view/Overlay/Overlay.dart';
import 'package:flutter_app/view/Event/event.dart';
import 'package:flutter_app/view/Search/SearchPage.dart';
import 'package:flutter_app/view/Dome/PassValue.dart';
import 'package:flutter_app/view/Dome/ancestorWidgetOfExactType.dart';
import 'package:flutter_app/view/Dome/inheritedwidget01.dart';
import 'package:flutter_app/view/Dome/inheritedwidget02.dart';

final routes = {
  "index":(context) => new TextPage(),
  "container": (context) => new ContainerPage(),
  "listComponent": (context) => new ListPage(),
  "animationPage": (context) => new AnimationPage(),
  "heroPage": (context) => new HeroAnimationRoute(),
  "PopupMenuButton": (context) => new PopupMenuButtonDemo(),
  "Overlay": (context) => new OverlayDome(),
  "eventPage": (context) => new EventPage(),
  "searchPage": (context) => new Search(),
  "passValuePage": (context) => new PassValue(),
//  "ancestorWidgetOfExactType": (context) => new Foo(),
  "inheritedwidget": (context) => new InheritedWidgetConst(),
  "inheritedwidget1": (context) => new Page(),
};