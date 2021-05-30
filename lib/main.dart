import 'package:digistarts/app/app_binding.dart';
import 'package:digistarts/app/modules/home/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  AppBinding().dependencies();
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
      home: HomeView(),
    );
  }
}
