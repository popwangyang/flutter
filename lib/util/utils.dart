
import 'dart:math';

String getRandomNumber(){
  String alphabet = 'qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM';
  int strLength = 30;
  String result = '';
  for(var i = 0; i < strLength; i++){
    result = result + alphabet[Random().nextInt(alphabet.length)];
  }
  return result;
}