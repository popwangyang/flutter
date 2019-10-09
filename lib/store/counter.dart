import 'package:flutter/foundation.dart';

class CounterNotifier with ChangeNotifier {
  int _count = 0;

  int _number = 100;

  int get count => _count;

  increment() async{
    _count++;
    notifyListeners();
  }

  Future<int> getCount(){
    return Future.delayed(Duration(seconds: 2),(){
      return _number;
    });
  }
}