// ignore_for_file: deprecated_member_use, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:my_first_app/secondView.dart';
import 'package:provider/provider.dart';

import 'todo.dart';

//--------------------------------------------------------------------------------------------------
//Appen börjar här

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => (TodoList()),
      child: MaterialApp(title: 'To do', home: MainView())));
}

class MainView extends StatefulWidget {
  MainView({Key? key}) : super(key: key);
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  var filterSetting = 'all';

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
      body: Consumer<TodoList>(
        builder: (context, state, child) => _list(
          getFilteredList(state.list, filterSetting),
        ),
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
              Provider.of<TodoList>(context, listen: false).addTodo(newTodo);
            }
          }),
    );
  }

  List getFilteredList(allItem, settings) {
    if (settings == "All") return allItem;
    if (settings == "Done") {
      return [];
    }
    return allItem;
  }

  Widget _list(title) {
    return ListView.builder(
        itemBuilder: (context, index) => buildSingleCheckbox(title[index]),
        itemCount: title.length);
  }

  //Checkbox
  Widget buildSingleCheckbox(Todo notification) => _buildCheckbox(
        notification: notification,
        onClicked: () {
          setState(() {
            final newValue = !notification.value;
            notification.value = newValue;
            // Skriv en if sats för att få överstruken text vid avbockning!
          });
        },
      );

  Widget _buildCheckbox({
    required Todo notification,
    required VoidCallback onClicked,
  }) =>
      Column(
        children: [
          ListTile(
            onTap: onClicked,
            leading: Checkbox(
              value: notification.value,
              onChanged: (value) => onClicked(),
            ),
            title: Text(
              notification.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,

                decoration:
                    notification.value ? TextDecoration.lineThrough : null,
                //'decoration' ska endast finnas om den är avbockad
              ),
            ),
            trailing: IconButton(
              onPressed: () async {
                var state = Provider.of<TodoList>(context, listen: false);
                state.removeTodo(notification);
              },
              icon: Icon(Icons.delete),
            ),
          ),
          Divider(
            thickness: 2,
          ),
        ],
      );
}
