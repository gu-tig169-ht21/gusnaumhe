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
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      home: MainView(),
    ); //MaterialApp
  }
}

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
        // ignore: prefer_const_constructors
        title: Text(
          'TIG169 TODO',        
          style: const TextStyle(color: Colors.white,fontSize: 24, fontWeight: FontWeight.bold),
          ),
        actions: [
          IconButton(icon: Icon(Icons.more_vert), 
          onPressed: () {

          }),
        ], 
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //_appBar(),
            ...notifications.map(buildSingleCheckbox).toList(),
           // _buildCheckbox(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
         onPressed: () {
         const Icon(Icons.add); 
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondView()));
      }),
    ); 
  }


  Widget _appBar() {
    return Container(
      height: 53,
      decoration: BoxDecoration(color: Colors.blueGrey[200]),
      child: Center(child: Text('TIG169 TODO', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),)
      );
    }

  Widget buildSingleCheckbox(NotificationSetting notification) =>
    _buildCheckbox(
      notification: notification,
      onClicked: () {
        setState(() {
          final newValue = !notification.value;
          notification.value = newValue;
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
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
    );

  void setState(Null Function() param0) {} 
}

class SecondView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold();
  }
}



