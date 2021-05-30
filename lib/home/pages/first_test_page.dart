import 'dart:ui';

import 'package:flutter/material.dart';

class FirstTestPage extends StatefulWidget {
  @override
  _FirstTestPageState createState() => _FirstTestPageState();
}

class _FirstTestPageState extends State<FirstTestPage> {
  List<int> numberList = [];
  List<int> noRepeatedNumberList = [];
  String _inputText = '';
  bool wasCalculator = false;

  final _controller = TextEditingController();

  _orderList() {
    numberList.sort((a, b) => a.compareTo(b));
    noRepeatedNumberList = numberList.toSet().toList();
    return noRepeatedNumberList;
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
              onChanged: (String value) {
                setState(() {
                  _inputText = value;
                });
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Entrada',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add, size: 30, color: Colors.black),
                  onPressed: _controller.text.trim().isEmpty
                      ? () {}
                      : () {
                          setState(() {
                            numberList.add(int.parse(_inputText.trim()));
                            _controller.clear();
                          });
                        },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(40.0),
                  ),
                ),
              ),
              cursorColor: Colors.black,
            ),
            !wasCalculator
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Container(
                      color: Colors.grey[200],
                      padding: numberList.length == 0
                          ? EdgeInsets.zero
                          : EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          numberList.length > 0
                              ? Text(
                                'Digitações:',
                                style: TextStyle(fontSize: 18),
                              )
                              : Container(),
                          Padding(
                            padding: numberList.length > 0 ? EdgeInsets.only(top:  8.0) : EdgeInsets.zero,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: numberList.length,
                              itemBuilder: (ctx, i) => Text(
                                '${numberList[i]}',
                                style: TextStyle(fontWeight: FontWeight.bold),
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
                          Text(
                            'Ordenação:',
                            style: TextStyle(fontSize: 18),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: noRepeatedNumberList.length,
                              itemBuilder: (ctx, i) => Text(
                                '${noRepeatedNumberList[i]}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            !wasCalculator
                ? Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                          width: maxWidth * 0.4,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          // padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                numberList.clear();
                                wasCalculator = false;
                              });
                            },
                            child: Text(
                              'Limpar lista',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: maxWidth * 0.4,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        // padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          onPressed: numberList.length > 0
                              ? () {
                                  setState(() {
                                    _orderList();
                                    wasCalculator = true;
                                  });
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
                    width: maxWidth * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          numberList.clear();
                          wasCalculator = false;
                        });
                      },
                      child: Text(
                        'Limpar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
