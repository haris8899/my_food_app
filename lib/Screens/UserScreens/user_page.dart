import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_food_app/widgets/large_text.dart';
import 'package:my_food_app/widgets/my_button.dart';

class UserPage extends StatelessWidget {
  UserPage({super.key});
  final User = FirebaseAuth.instance.currentUser!;
  void SignUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            LargeText(text: User.email!),
            MyButton(text: "Log Out",onTap: SignUserOut,),
          ],
        ),
      ),
    );
  }
}