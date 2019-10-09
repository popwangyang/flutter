import 'package:flutter/foundation.dart';

class StateNotifier with ChangeNotifier {
 bool _flag = true;

 bool get flag => _flag;
}