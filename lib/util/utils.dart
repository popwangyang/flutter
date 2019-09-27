
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

List<Map> transformData({List<Map> list}){

  List<Map> result = new List();
  int length = 0;

  if(list.length != 0){
    length = (list.length / 2).ceil();
  }

  for(var i = 0; i < length; i++){
    int index = i*2;
    Map item = {
      'value1': {
        'text': listHasValue(index, list),
        'index': index
      },
      'value2': {
        'text': listHasValue(index + 1, list),
        'index': index + 1
      },
    };
    result.add(item);
  }
  return result;
}

Map listHasValue(int index, List<Map> list){
  if(index <= (list.length -1)){
    return list[index];
  }else{
    return {
      'value': '',
      'type': 0
    };
  }
}