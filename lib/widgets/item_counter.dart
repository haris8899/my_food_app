import 'package:flutter/material.dart';
import 'package:my_food_app/utils/dimensions.dart';
import 'package:my_food_app/widgets/large_text.dart';

class ItermCounterWidget extends StatefulWidget {
  int count;
  final Function()? Remove;
  final Function()? Add;
  ItermCounterWidget({super.key, required this.count, required this.Remove, required this.Add});

  @override
  State<ItermCounterWidget> createState() => _ItermCounterWidgetState();
}

class _ItermCounterWidgetState extends State<ItermCounterWidget> {

  void addquantity() {
    setState(() {
      widget.count += 1;
    });
  }

  void decreasequantity() {
    setState(() {
      if (widget.count > 1) {
        widget.count -= 1;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: Dimensions.width20,
          right: Dimensions.width20,
          top: Dimensions.height20,
          bottom: Dimensions.height20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.height20),
        color: Colors.white,
      ),
      child: Row(children: [
        InkWell(
          onTap: widget.Remove,
          child: Icon(
            Icons.remove,
            color: Colors.grey,
          ),
        ),
        SizedBox(
          width: Dimensions.width10 / 2,
        ),
        LargeText(text: widget.count.toString()),
        SizedBox(
          width: Dimensions.width10 / 2,
        ),
        InkWell(
          onTap: widget.Add,
          child: Icon(Icons.add, color: Colors.grey)
        ),
      ]),
    );
  }
}
