import 'package:digistarts/app/modules/home/pages/secondPage/controller/second_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'button_row_widget.dart';
import 'button_widget.dart';

class KeyboardWidget extends GetView<SecondPageController> {
  final Color colorGreyDark = Color.fromRGBO(74, 74, 74, 1);
  final Color colorCyan = Colors.cyan[900]!;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.4,
      child: Column(
        children: [
          ButtonRow([
            Button(
              text: '/',
              onPressed: () => controller.division(),
              color: colorCyan,
            ),
            Button(
              text: '%',
              onPressed: () => controller.rest(),
              color: colorGreyDark,
            ),
            Button(
              text: 'AC',
              color: colorGreyDark,
              onPressed: () => controller.clearConsole(),
            ),
          ]),
          SizedBox(height: 1),
          ButtonRow([
            Button(
              text: '-',
              onPressed: () => controller.subtract(),
              color: colorCyan,
            ),
            Button(
              text: '+',
              onPressed: () => controller.sum(),
              color: colorCyan,
            ),
            Button(
              text: 'x',
              onPressed: () => controller.multiplication(),
              color: colorCyan,
            ),
          ]),
        ],
      ),
    );
  }
}
