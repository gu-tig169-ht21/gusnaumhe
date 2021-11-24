// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:my_first_app/todo.dart';

class MyState extends ChangeNotifier {
  late List<Todo> _list = [];
  int _filterBy = 1;

  List<Todo> get list => _list;

  int get filterBy => _filterBy;

  

//Filtrering
  void setFilterBy(int filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }

//Lägg till Todo
  void addTodo(Todo todo) {
    _list.add(todo);
    notifyListeners();
  }

  //Ta bort Todo
  void removeTodo(Todo todo) async {
    _list.remove(todo);
    notifyListeners();
  }

  void setIsDone(Todo todo) {
    final newValue = !todo.value;
    todo.value = newValue;
    notifyListeners();
  }
}
