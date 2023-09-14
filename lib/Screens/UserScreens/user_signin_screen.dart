import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_food_app/Screens/UserScreens/user_signup_screen.dart';
import 'package:my_food_app/utils/dimensions.dart';
import 'package:my_food_app/widgets/my_button.dart';
import 'package:my_food_app/widgets/password_field.dart';

import '../../widgets/email_field.dart';

class UserSignInWidget extends StatefulWidget {
  const UserSignInWidget({super.key});

  @override
  State<UserSignInWidget> createState() => _UserSignInWidgetState();
}

class _UserSignInWidgetState extends State<UserSignInWidget> {

  final UsernameController = TextEditingController();

  final PasswordController = TextEditingController();

  void ShowErrorMessage(String text) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(text),
      ),
    );
  }

  void SignUserIn() async {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: UsernameController.text,
        password: PasswordController.text,
      );
      Navigator.pop(context);
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
            SizedBox(height: Dimensions.height80,),
            Padding(
              padding: EdgeInsets.all(Dimensions.height20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Login", style: TextStyle(color: Colors.white, fontSize: Dimensions.height45),),
                  SizedBox(height: Dimensions.height10,),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.BorderRadius30), topRight: Radius.circular(Dimensions.BorderRadius30))
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(Dimensions.height30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: Dimensions.height45,),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(Dimensions.BorderRadius15),
                            boxShadow: [BoxShadow(
                              color: Colors.grey,
                              blurRadius: 20,
                              offset: Offset(0, 10)
                            )]
                          ),
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
                            ],
                          ),
                        ),
                        SizedBox(height: Dimensions.height30,),
                        Text("Forgot Password?", style: TextStyle(color: Colors.grey),),
                        SizedBox(height: Dimensions.height30,),
                        MyButton(text: "Login",onTap: SignUserIn,),
                        SizedBox(height: Dimensions.height45,),
                        Text("Continue with social media", style: TextStyle(color: Colors.grey),),
                        SizedBox(height: Dimensions.height30,),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                height: Dimensions.height45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Dimensions.BorderRadius30),
                                  color: Colors.blue
                                ),
                                child: Center(
                                  child: Text("Google", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                ),
                              ),
                            ),
                            SizedBox(width: Dimensions.width30,),
                            Expanded(
                              child: Container(
                                height: Dimensions.height45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Dimensions.BorderRadius30),
                                  color: Colors.black
                                ),
                                child: Center(
                                  child: Text("Facebook", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Dimensions.height20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Not a Member? ", style: TextStyle(color: Colors.grey),),
                            InkWell(
                              child: Text("Register Now",style: TextStyle(color: Colors.blue),),
                              onTap: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const UserSignUpWidget()),),
                                  },
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