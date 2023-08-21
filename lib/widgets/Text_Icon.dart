import 'package:flutter/material.dart';
import 'package:my_food_app/widgets/small_text.dart';

class TextIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Color iconColor;
  TextIcon(
      {
        super.key,
        required this.icon,
        required this.text,
        this.color=Colors.grey,
        required this.iconColor
      });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: iconColor,),
        SizedBox(width: 2,),
        SmallText(text: text,color: color,),
      ],
    );
  }
}
