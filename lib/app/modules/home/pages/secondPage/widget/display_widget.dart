import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:digistarts/app/modules/home/pages/secondPage/controller/second_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisplayWidget extends GetView<SecondPageController> {
  final _firstTextController = TextEditingController();
  final _secondTextController = TextEditingController();

  formField({
    required Function(String) onChanged,
    required TextEditingController textController,
    required String label,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        controller: textController,
        onChanged: onChanged,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          suffix: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () => textController.clear(),
              child: Icon(Icons.clear, color: Colors.white),
            ),
          ),
          fillColor: Colors.white,
          labelStyle: TextStyle(color: Colors.grey),
          labelText: label,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(40.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(40.0)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(48, 48, 48, 1),
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            formField(
              label: 'Entre com o primeiro valor: ',
              onChanged: (String value) => controller.firstInput = value,
              textController: _firstTextController,
            ),
            formField(
              label: 'Entre com o segundo valor: ',
              onChanged: (String value) => controller.secondInput = value,
              textController: _secondTextController,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                '${controller.endResult}',
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
          ],
        ),
      ),
    );
  }
}
