import 'dart:convert';

import 'package:http/http.dart';
import 'package:networking_request/model/post_model.dart';
import 'package:networking_request/model/todos/todos_model.dart';

class NetworkingService {
  static String BASE = "jsonplaceholder.typicode.com";
  static Map<String, String> header = {
    'Content-type': 'application/json; charset=UTF-8',
  };

  static String API_POSTS = "/todos";
  static String API_CREATE = "/todos";
  static String API_UPDATE = "/todos/"; //id
  static String API_DELETE = "/todos/"; //id

  static Future<String> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await get(uri, headers: header);
    if (response.statusCode == 200) {
      return response.body;
    }
    return response.body;
  }

  static Future<String> POST(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await post(uri, headers: header, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return response.body;
  }

  static Future<String> UPDATE(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await put(uri, headers: header, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return response.body;
  }

  static Future<String> DELETE(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await delete(uri, headers: header, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return response.body;
  }

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = Map();
    return params;
  }

  static Map<String, String> paramsCreate(TodosModel todos) {
    Map<String, String> params = Map();
    params.addAll({
      "userId": todos.userId.toString(),
      "title": todos.title,
      "completed": todos.completed.toString(),
    });
    return params;
  }

  static Map<String, String> paramsUpdate(TodosModel todos) {
    Map<String, String> params = Map();
    params.addAll({
      "userId": todos.userId.toString(),
      "title": todos.title,
      "completed": todos.completed.toString(),
    });
    return params;
  }

  static List<TodosModel> parsePostList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<TodosModel>.from(json.map((x) => TodosModel.fromJson(x)));
    return data;
  }
}
