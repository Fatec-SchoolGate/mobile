import 'package:flutter/material.dart';

enum ButtonVariantion {
  primary,
  secondary
}

class Button extends StatelessWidget {
  Button({
    super.key,
    required this.onPressed,
    required this.text
  });
  
  ButtonVariantion variation = ButtonVariantion.primary;
  final VoidCallback onPressed;
  String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text)
    );
  }
}