// ignore_for_file: unnecessary_this, no_logic_in_create_state, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/todo.dart';
import 'package:my_first_app/main.dart';

class SecondView extends StatefulWidget {
  final Todo todo;

  SecondView(this.todo);

  @override
  State<StatefulWidget> createState() {
    return _SecondViewState(todo);
  }
}

class _SecondViewState extends State<SecondView> {
  late String? title;
  late bool value;

  late TextEditingController _controller;

  _SecondViewState(Todo todo) {
    this.title = todo.title;
    this.value = todo.value;

    _controller = TextEditingController(text: todo.title);

  }
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        // ignore: prefer_const_constructors
        title: Text(
          'TIG169 TODO',
          style: const TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _textBox(),
            _icon(),
          ],
        ),
      ),
    );
  }

  Widget _textBox() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 30),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'What are you going to do?'),
      ),
    );
  }

  Widget _icon() {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.pop(
            context,
            Todo(title: _controller.text, value: false),
          );
        },
        icon: Icon(Icons.add),
        label: Text('ADD'),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blueGrey[100]),
            textStyle: MaterialStateProperty.all(
                const TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
      ),
    );
  }
}
