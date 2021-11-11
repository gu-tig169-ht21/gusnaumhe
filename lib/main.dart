import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _appBar(),
          ],
        ), //Column
      ), //Center
    ); //Scaffold 
  }

  Widget _appBar() {
    return Container(
      height: 53,
      decoration: BoxDecoration(color: Colors.blue),
      child: Center(child: Text('Title', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),)
    );
  }
}
