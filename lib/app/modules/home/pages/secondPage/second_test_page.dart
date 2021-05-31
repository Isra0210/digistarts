import 'package:digistarts/app/modules/home/pages/secondPage/widget/display_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'controller/second_page_controller.dart';
import 'widget/keyboard_widget.dart';

class SecondPage extends GetView<SecondPageController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DisplayWidget(),
        KeyboardWidget(),
      ],
    );
  }
}
