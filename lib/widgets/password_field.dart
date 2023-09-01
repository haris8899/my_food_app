import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_food_app/utils/dimensions.dart';

class PasswordField extends StatefulWidget {
  final String? text;
  const PasswordField({super.key, required this.text});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  late String hinttext;
  bool passwordVisible=false;

  @override
  void initState() {
    super.initState();
    hinttext = widget.text!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.height10),
      decoration: BoxDecoration(),
      child: TextField(
        obscureText: !passwordVisible,
        decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
            suffixIcon: IconButton(
                      icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(
                          () {
                            passwordVisible = !passwordVisible;
                          },
                        );
                      },
                    ),
                  ),),
    );
  }
}
