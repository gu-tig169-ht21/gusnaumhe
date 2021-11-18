// NotificationSetting = Todo
// ignore_for_file: prefer_final_fields

import 'dart:core';

import 'package:flutter/cupertino.dart';

class Todo {
  String title;
  bool value;

  Todo({
    required this.title,
    this.value = false,
  });
}

class TodoList extends ChangeNotifier {
  late List<Todo> _list = [];

  List<Todo> get list {
    return _list;
  }

  
//Lägg till Todo
  void addTodo(Todo notification) {
    _list.add(notification);
    notifyListeners();
  }

  //Ta bort Todo
  void removeTodo(Todo notification) async {
    _list.remove(notification);
    notifyListeners();
  }

}