import 'dart:convert';

class JsonHandler{
  static dynamic decodeJson(String response){
    return jsonDecode(response);
  }

  static dynamic encodeJson(Object? object){
    return jsonEncode(object);
  }
}