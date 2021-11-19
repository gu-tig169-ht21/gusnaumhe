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

//FILTRERING
  int _filterBy = 1; //bytte till int

  List<Todo> get list => _list;

  int get filterBy => _filterBy;
//SLUTAR HÄR

/*
  List<Todo> get list {
    return _list;
  }
*/
  
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

  //Filtrering
  void setFilterBy(int filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }

  List<Todo>?_filterList(list, filterBy){
    if (filterBy == 1) return list;
    if (filterBy == 2)
    return list.where((list) => list.value == true).toList;
    if (filterBy == 3)
    return list.where((list) => list.vakue == false).toList;
    return null;
  }
}