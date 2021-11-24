// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/model.dart';
import 'package:my_first_app/todo.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  List<Todo> list;

  TodoList(this.list);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: list
          .map(
            (Todo todo) => _buildCheckbox(
              context: context,
              todo: todo,
              onClicked: () {
                var state = Provider.of<MyState>(context, listen: false);
                state.setIsDone(todo);
              },
            ),
          )
          .toList(),
    );
  }

  Widget _buildCheckbox({
    required BuildContext context,
    required Todo todo,
    required VoidCallback onClicked,
  }) =>
      Column(
        children: [
          ListTile(
            onTap: onClicked,
            leading: Checkbox(
              value: todo.value,
              onChanged: (value) => onClicked(),
            ),
            title: Text(
              todo.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,

                decoration: todo.value ? TextDecoration.lineThrough : null,
                //'decoration' ska endast finnas om den är avbockad
              ),
            ),
            trailing: IconButton(
              onPressed: () async {
                var state = Provider.of<MyState>(context, listen: false);
                state.removeTodo(todo);
              },
              icon: Icon(Icons.close),
            ),
          ),
          Divider(
            thickness: 2,
          ),
        ],
      );
}
