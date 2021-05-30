import 'package:digistarts/home/pages/first_test_page.dart';
import 'package:digistarts/home/pages/second_test_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;

  final List<Widget> _screens = [
    FirstTestPage(),
    SecondTestPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Digistarts',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: _screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[200],
        unselectedItemColor: Colors.black,
        onTap: (int newIndex) {
          setState(() {
            _index = newIndex;
          });
        },
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward),
            label: 'Teste 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: "Teste 2",
          ),
        ],
      ),
    );
  }
}
