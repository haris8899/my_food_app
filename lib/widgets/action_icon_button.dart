import 'package:flutter/material.dart';
import 'package:my_food_app/utils/dimensions.dart';

class ActionIconButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color IconColor;
  final double size;
  ActionIconButton(
    {
      super.key, 
      required this.icon, 
      this.backgroundColor = Colors.white, 
      this.IconColor = Colors.black38, 
      this.size = 40,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroundColor.withOpacity(0.7),
      ),
      child: Icon(
        icon,
        color: IconColor,
        size: Dimensions.icon16,
      ),
    );
  }
}