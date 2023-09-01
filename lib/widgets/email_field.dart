import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class EmailField extends StatelessWidget {
  final String text;
  const EmailField({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.height10),
      decoration: BoxDecoration(),
      child: TextField(
        decoration: InputDecoration(
            hintText: text,
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none),
      ),
    );
  }
}
