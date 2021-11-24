// ignore_for_file: deprecated_member_use, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:my_first_app/model.dart';
import 'package:my_first_app/secondView.dart';
import 'package:my_first_app/todoList.dart';
import 'package:provider/provider.dart';

import 'todo.dart';

//--------------------------------------------------------------------------------------------------
//Appen börjar här

void main() {
  var state = MyState();
  runApp(ChangeNotifierProvider(
      create: (context) => (MyState()),
      child: MaterialApp(title: 'To do', home: MainView())));
}

class MainView extends StatefulWidget {
  MainView({Key? key}) : super(key: key);
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
 
  get value => null;
  //----------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        title: const Text(
          'TIG169 TODO',
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          PopupMenuButton(
            onSelected: (int value) {
              Provider.of<MyState>(context, listen: false).setFilterBy(value);
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("All"),
                value: 1,
              ),
              PopupMenuItem(
                child: Text("Done"),
                value: 2,
              ),
              PopupMenuItem(
                child: Text("Undone"),
                value: 3,
              ),
            ],
          ),
        ],
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) => 
        TodoList(_filterList(state.list, state.filterBy)),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: Colors.blueGrey[200],
          onPressed: () async {
            var newTodo = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondView(
                  Todo(title: '', value: false),
                ),
              ),
            );
            if (newTodo != null) {
              Provider.of<MyState>(context, listen: false).addTodo(newTodo);
            }
          }),
    );
  }
  List<Todo> _filterList(List<Todo> list, int filterBy) {
    if (filterBy == 1) return list;
    if (filterBy == 2) {
      return list.where((Todo todo) => todo.value == true).toList();
    }
    if (filterBy == 3) {
      return list.where((Todo todo) => todo.value == false).toList();
    }
    return list;
  }
}


