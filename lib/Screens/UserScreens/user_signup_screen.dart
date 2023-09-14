import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_food_app/utils/dimensions.dart';
import 'package:my_food_app/widgets/email_field.dart';
import 'package:my_food_app/widgets/my_button.dart';
import 'package:my_food_app/widgets/password_field.dart';

import '../../widgets/action_icon_button.dart';

class UserSignUpWidget extends StatefulWidget {
  const UserSignUpWidget({super.key});

  @override
  State<UserSignUpWidget> createState() => _UserSignUpWidgetState();
}

class _UserSignUpWidgetState extends State<UserSignUpWidget> {
  final UsernameController = TextEditingController();

  final PasswordController = TextEditingController();

  final ConfirmPasswordController = TextEditingController();

  void ShowErrorMessage(String text) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(text),
      ),
    );
  }

  void SignUserUp() async {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));

    try {
      if (PasswordController.text == ConfirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: UsernameController.text,
          password: PasswordController.text,
        );
        Navigator.pop(context);
        Navigator.pop(context);
      } else {
        Navigator.pop(context);
        ShowErrorMessage("Passwords Don't match!");
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == "invalid-email") {
        ShowErrorMessage("Email is Invalid");
      } else if (e.code == 'user-not-found') {
        ShowErrorMessage("No User exists with these credentials");
      } else if (e.code == 'wrong-password') {
        ShowErrorMessage("Password Incorrect");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue[900],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: Dimensions.height30,
                  left: Dimensions.width15,
                  right: Dimensions.width15),
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: ActionIconButton(icon: Icons.arrow_back_ios),
              ),
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            Padding(
              padding: EdgeInsets.all(Dimensions.height20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white, fontSize: Dimensions.height45),
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.BorderRadius30),
                        topRight: Radius.circular(Dimensions.BorderRadius30))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(Dimensions.height30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: Dimensions.height45,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  Dimensions.BorderRadius15),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              EmailField(
                                text: "Email",
                                Controller: UsernameController,
                              ),
                              PasswordField(
                                text: "Password",
                                Controller: PasswordController,
                              ),
                              PasswordField(
                                text: "Confirm Password",
                                Controller: ConfirmPasswordController,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height30,
                        ),
                        MyButton(
                          text: "Sign Up",
                          onTap: SignUserUp,
                        ),
                        SizedBox(
                          height: Dimensions.height45,
                        ),
                        Text(
                          "Continue with social media",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: Dimensions.height30,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                height: Dimensions.height45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.BorderRadius30),
                                    color: Colors.blue),
                                child: Center(
                                  child: Text(
                                    "Google",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Dimensions.width30,
                            ),
                            Expanded(
                              child: Container(
                                height: Dimensions.height45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.BorderRadius30),
                                    color: Colors.black),
                                child: Center(
                                  child: Text(
                                    "Facebook",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
