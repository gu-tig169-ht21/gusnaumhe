import 'package:flutter/material.dart';
import 'package:my_first_app/todo.dart';

class SecondView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return SecondViewState();
  }
}

class SecondViewState extends State<SecondView> {
  late String title;
  late TextEditingController textEditingController;
  final _formKey = GlobalKey<FormState>();

  SecondViewState() {

    textEditingController = TextEditingController(text: '');

  }
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    textEditingController.dispose();
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
      body: Form(
        key: _formKey,
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
      child: TextFormField(
        validator: (value) {
          if(value == null || value.isEmpty) {
            return 'Please enter text';
          }
          return null;
        },
        controller: textEditingController,
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
          if (_formKey.currentState!.validate()) {
          Navigator.pop(
            context,
            textEditingController.text,
          );    
          }
          
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
