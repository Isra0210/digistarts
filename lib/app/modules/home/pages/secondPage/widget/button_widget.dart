import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Button extends GetView {

  final String text;
  final Color color;
  final void Function() onPressed;

  Button({
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
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
