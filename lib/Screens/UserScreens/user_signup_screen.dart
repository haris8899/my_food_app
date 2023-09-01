import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_food_app/utils/dimensions.dart';
import 'package:my_food_app/widgets/email_field.dart';
import 'package:my_food_app/widgets/password_field.dart';

import '../../widgets/action_icon_button.dart';

class UserSignUpWidget extends StatelessWidget {
  const UserSignUpWidget({super.key});

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
              padding: EdgeInsets.only(top: Dimensions.height30,left: Dimensions.width15, right: Dimensions.width15),
              child:InkWell(
                    onTap:()=> Navigator.pop(context),
                    child: ActionIconButton(
                      icon: Icons.arrow_back_ios
                    ),
                  ),
            ),
            SizedBox(height: Dimensions.height30,),
            Padding(
              padding: EdgeInsets.all(Dimensions.height20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: Dimensions.height45),),
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
                              EmailField(text: "Email"),
                              PasswordField(text: "Password"),
                              PasswordField(text: "Confirm Password"),
                            ],
                          ),
                        ),
                        SizedBox(height: Dimensions.height30,),
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: Dimensions.width45),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.BorderRadius30),
                            color: Colors.orange[900]
                          ),
                          child: Center(
                            child: Text("Sign Up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        ),
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