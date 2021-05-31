import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Button extends GetView {

  final String text;
  final bool big;
  final Color color;
  final void Function() onPressed;

  Button({
    required this.text,
    required this.big,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: big ? 2 : 1,
      child: Container(
        color: color,
        child: TextButton(
          child: Text(
            '$text',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w200,
            ),
          ),
          onPressed: () => onPressed(),
        ),
      ),
    );
  }
}
