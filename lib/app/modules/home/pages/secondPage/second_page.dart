import 'package:digistarts/app/modules/home/pages/secondPage/widget/display_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'controller/second_page_controller.dart';
import 'widget/keyboard_widget.dart';

class SecondPage extends GetView<SecondPageController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(48, 48, 48, 1),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: DisplayWidget(),
          ),
          KeyboardWidget(),
        ],
      ),
    );
  }
}
