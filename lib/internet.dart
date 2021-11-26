// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_first_app/todo.dart';

const API_KEY = '0f9819ac-78cd-4b7c-8a75-ae86be86abad';
const API_URL = 'https://todoapp-api-pyq5q.ondigitalocean.app';

class InternetConnection {
  static Future<List<Todo>> addTodo(String todoTitle) async {
    var bodyString = jsonEncode({
      'title': todoTitle,
    });
    try {
      var response = await http.post(
        Uri.parse('$API_URL/todos?key=$API_KEY'),
        body: bodyString,
        headers: {'Content-Type': 'application/json'},
      );
      bodyString = response.body;
      var list = jsonDecode(bodyString);

      return list.map<Todo>((data) {
        return Todo.fromJson(data);
      }).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future removeTodo(String todoId) async {
    var response = await http
        .delete(Uri.parse('$API_URL/todos/$todoId?key=$API_KEY&_confirm=true'));
    var bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<Todo>((data) {
      return Todo.fromJson(data);
    }).toList();
  }

  static Future updateTodo(String todoId) async {
    var response = await http
        .put(Uri.parse('$API_URL/todos/$todoId?key=$API_KEY&_confirm=true'));
    var bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<Todo>((data) {
      return Todo.fromJson(data);
    }).toList();
  }

  static Future<List<Todo>> getTodo() async {
    var response = await http.get(Uri.parse('$API_URL/todos?key=$API_KEY'));
    String bodyString = response.body;
    var json = jsonDecode(bodyString);

    return json.map<Todo>((data) {
      return Todo.fromJson(data);
    }).toList();
  }
}
