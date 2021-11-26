// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:my_first_app/internet.dart';
import 'package:my_first_app/todo.dart';

class MyState extends ChangeNotifier {
  late List<Todo> _list = [];
  int _filterBy = 1;

  List<Todo> get list => _list;

  int get filterBy => _filterBy;

 Future getList() async {
   List<Todo> list =await InternetConnection.getTodo();
   _list = list;
   notifyListeners();
 } 

//Filtrering
  void setFilterBy(int filterBy) {
    _filterBy = filterBy;
    notifyListeners();
  }

//Lägg till Todo
  void addTodo(String todoTitle) async { 
    _list = await InternetConnection.addTodo(todoTitle);
    notifyListeners();
  }

  //Ta bort Todo
  void removeTodo(Todo todo) async {
    _list = await InternetConnection.removeTodo(todo.id);
    notifyListeners();
  }

  void setIsDone(Todo todo) async {
    _list = await InternetConnection.updateTodo(todo.id.toString());
    //final newValue = !todo.value;
    //todo.value = newValue;
    notifyListeners();
  }
}
