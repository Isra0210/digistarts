import 'package:digistarts/app/modules/home/pages/secondPage/controller/second_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'button_row_widget.dart';
import 'button_widget.dart';

class KeyboardWidget extends GetView<SecondPageController> {
  final Color colorGreyDark = Color.fromRGBO(82, 82, 82, 1);
  final Color colorGrey = Color.fromRGBO(112, 112, 112, 1);
  final Color colorCyan = Colors.cyan[900]!;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.6,
      child: Column(
        children: [
          ButtonRow([
            Button(
              text: 'AC',
              color: colorGreyDark,
              onPressed: () => controller.clearConsole(),
              big: false,
            ),
            Button(
              text: '%',
              onPressed: () => controller.calculate('%'),
              color: colorGreyDark,
              big: false,
            ),
            Button(
              text: '=',
              onPressed: () => controller.calculate('='),
              color: colorGreyDark,
              big: false,
            ),
          ]),
          SizedBox(height: 1),
          ButtonRow([
            Button(
              text: '1',
              onPressed: () => controller.addItem('1'),
              color: colorGrey,
              big: false,
            ),
            Button(
              text: '0',
              onPressed: () => controller.addItem('0'),
              color: colorGrey,
              big: false,
            ),
          ]),
          SizedBox(height: 1),
          ButtonRow([
            Button(
              text: '-',
              onPressed: () => controller.calculate('-'),
              color: colorCyan,
              big: false,
            ),
            Button(
              text: '+',
              onPressed: () => controller.calculate('+'),
              color: colorCyan,
              big: false,
            ),
            Button(
              text: 'x',
              onPressed: () => controller.calculate('x'),
              color: colorCyan,
              big: false,
            ),
            Button(
              text: '/',
              onPressed: () => controller.calculate('/'),
              color: colorCyan,
              big: false,
            ),
          ]),
        ],
      ),
    );
  }
}
