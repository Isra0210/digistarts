import 'dart:ui';

import 'package:digistarts/app/modules/home/pages/firstPage/controller/first_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstPage extends GetView<FirstPageController> {
  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController();

    return Obx(
      () => Container(
        padding: const EdgeInsets.all(20),
        child: Scaffold(
          body: ListView(
            shrinkWrap: true,
            children: [
              TextFormField(
                controller: _textController,
                onChanged: (String value) => controller.inputText = value,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Entrada',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.add, size: 30, color: Colors.black),
                    onPressed: controller.inputText.trim().isEmpty
                        ? () => null
                        : () {
                            if (int.parse(controller.inputText.trim()) >
                                    -1000 &&
                                int.parse(controller.inputText.trim()) <=
                                    1000) {
                              controller.numberList.add(
                                int.parse(
                                  controller.inputText.trim(),
                                ),
                              );
                              controller.inputText = '';
                              _textController.clear();
                            }
                          },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  ),
                ),
                cursorColor: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                child: Text(
                  'Ex: -1000<=ENTRADA<=1000',
                  style: TextStyle(color: Colors.grey, fontSize: 12,)
                ),
              ),
              !controller.wasCalculator
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Container(
                        color: Colors.grey[200],
                        padding: controller.numberList.length == 0
                            ? EdgeInsets.zero
                            : EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            controller.numberList.length > 0
                                ? Text('Digitações:',
                                    style: TextStyle(fontSize: 18))
                                : Container(),
                            Padding(
                              padding: controller.numberList.length > 0
                                  ? EdgeInsets.only(top: 8.0)
                                  : EdgeInsets.zero,
                              child: Container(
                                constraints: BoxConstraints(maxHeight: 300),
                                child: ListView.builder(
                                  // physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.numberList.length,
                                  itemBuilder: (ctx, i) => Text(
                                    '${controller.numberList[i]}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        color: Colors.grey[200],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Ordenação:', style: TextStyle(fontSize: 18)),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:
                                    controller.noRepeatedNumberList.length,
                                itemBuilder: (ctx, i) => Text(
                                  '${controller.noRepeatedNumberList[i]}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
          bottomNavigationBar: !controller.wasCalculator
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Container(
                        width: Get.width * 0.4,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(
                          onPressed: () {
                            controller.numberList.clear();
                            controller.wasCalculator = false;
                          },
                          child: Text(
                            'Limpar lista',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: Get.width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton(
                        onPressed: controller.numberList.length > 0
                            ? () {
                                controller.orderList();
                                controller.wasCalculator = true;
                              }
                            : null,
                        child: Text(
                          'Ordenar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )
              : Container(
                  width: Get.width * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    onPressed: () {
                      controller.numberList.clear();
                      controller.wasCalculator = false;
                    },
                    child: Text(
                      'Limpar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
