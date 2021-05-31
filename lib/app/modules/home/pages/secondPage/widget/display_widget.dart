import 'package:auto_size_text/auto_size_text.dart';
import 'package:digistarts/app/modules/home/pages/secondPage/controller/second_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisplayWidget extends GetView<SecondPageController> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Color.fromRGBO(48, 48, 48, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(
                () => AutoSizeText(
                  '${controller.sendOutputValue()}',
                  minFontSize: 20,
                  maxFontSize: 80,
                  maxLines: 1,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    decoration: TextDecoration.none,
                    fontSize: 60,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
