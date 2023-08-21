import 'package:flutter/material.dart';

class LargeText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  LargeText({super.key,
  this.color = Colors.black,
  required this.text,
  this.size = 20,
  this.overFlow = TextOverflow.ellipsis
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: size
      ),
    );
  }
}
