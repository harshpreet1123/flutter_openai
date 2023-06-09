import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  final Color color;
  final String text;
  const Example({Key? key, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 32, bottom: 20, right: 32),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
      child: Text(
        text,
        style: const TextStyle(
            fontFamily: 'Cera Pro', fontWeight: FontWeight.w600, fontSize: 16),
      ),
    );
  }
}
