import 'package:digistarts/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste Digistarts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.cyan,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
