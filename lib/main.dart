// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';


class NotificationSetting {
  String title;
  bool value;

  NotificationSetting({
    required this.title,
    this.value = false,
  });
}
//--------------------------------------------------------------------------------------------------
//Appen börjar här

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      home: MainView(),
    ); //MaterialApp
  }
}

// ignore: use_key_in_widget_constructors
class MainView extends StatelessWidget {

  final notifications = [
      NotificationSetting(title: 'Write a book'),
      NotificationSetting(title: 'Do homework'),
      NotificationSetting(title: 'Tidy up room'),
  ];

  get value => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],

        title: const Text(
          'TIG169 TODO',        
          style: TextStyle(color: Colors.white,fontSize: 24, fontWeight: FontWeight.bold),
          ),
        actions: [
          IconButton(icon: Icon(Icons.more_vert), 
          onPressed: () {
            print('Pressed button');                   //Ändra till nått annat!
          }),
        ], 
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...notifications.map(buildSingleCheckbox).toList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blueGrey[200],
         onPressed: () { 
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondView()));
      }),
    ); 
  }

  Widget buildSingleCheckbox(NotificationSetting notification) =>
    _buildCheckbox(
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
    required NotificationSetting notification,
    required VoidCallback onClicked, 

  }) => ListTile(    
    onTap: onClicked,
    leading: Checkbox(
        value: notification.value,
        onChanged: (value) => onClicked(),
      ),
      title: Text(
        notification.title, 
        // ignore: prefer_const_constructors
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal), //decoration: TextDecoration.lineThrough),
                                                                      //'decoration' ska endast finnas om den är avbockad
        ),  
    );
                                        //Lägg till en delete icon i CheckBoxen!
  void setState(Null Function() param0) {} 
}


//Second View-----------------------------------------------------

// ignore: use_key_in_widget_constructors
class SecondView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
      // ignore: prefer_const_constructors
      title: Text(
          'TIG169 TODO',        
          style: const TextStyle(color: Colors.white,fontSize: 24, fontWeight: FontWeight.bold),
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
    return 
     Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 30),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'What are you going to do?',
            ),
          ),
        );

  }
  Widget _icon() {
    return Center(
         child: RaisedButton.icon(
          onPressed: (
                                      //Add the text from _textBox to 'final notifications'
          ) {},
          icon: Icon(Icons.add),
          label: Text('ADD'),
          color: Colors.blueGrey[50],
        ),     
    );
  }
}



