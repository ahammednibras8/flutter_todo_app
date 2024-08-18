import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String name;
  final Color bgColor;
  final Color fgColor;
  final VoidCallback onPressed;

  const Buttons({
    super.key,
    required this.name,
    required this.bgColor,
    required this.fgColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: fgColor,
      ),
      child: Text(name),
    );
  }
}
