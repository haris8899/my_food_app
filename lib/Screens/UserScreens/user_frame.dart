import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_food_app/Screens/UserScreens/user_page.dart';
import 'package:my_food_app/Screens/UserScreens/user_signin_screen.dart';
import 'package:my_food_app/widgets/large_text.dart';

class UserFrame extends StatelessWidget {
  const UserFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //User Log Check
          if (snapshot.hasData) {
            return UserPage();
          } else {
            return UserSignInWidget();
          }
        },
      ),
    );
  }
}
