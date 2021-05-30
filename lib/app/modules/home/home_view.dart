import 'package:digistarts/app/modules/home/pages/firstPage/first_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'controller/home_controller.dart';
import 'pages/secondPage/second_test_page.dart';

class HomeView extends GetView<HomeController> {
  final List<Widget> _screens = [FirstPage(), SecondPage()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Digistarts',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
          bottom: TabBar(
            indicatorWeight: 4,
            indicatorColor: Theme.of(context).primaryColor,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.white,
            labelStyle: TextStyle(fontSize: 18),
            tabs: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Teste 1"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Teste 2"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FirstPage(),
            SecondPage(),
          ],
        ),
      ),
    );
  }
}
