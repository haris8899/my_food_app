import 'package:flutter/material.dart';
import 'package:my_food_app/utils/dimensions.dart';
import 'package:my_food_app/widgets/large_text.dart';

class ItermCounterWidget extends StatefulWidget {
  const ItermCounterWidget({super.key});

  @override
  State<ItermCounterWidget> createState() => _ItermCounterWidgetState();
}

class _ItermCounterWidgetState extends State<ItermCounterWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height20,bottom: Dimensions.height20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.height20),
        color: Colors.white, 
      ),
      child: Row(
        children: [
          Icon(Icons.remove, color: Colors.grey,),
          SizedBox(width: Dimensions.width10/2,),
          LargeText(text: "0"),
          SizedBox(width: Dimensions.width10/2,),
          Icon(Icons.add, color: Colors.grey),
        ]
      ),
    );
  }
}