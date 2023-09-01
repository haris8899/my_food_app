import 'package:flutter/material.dart';
import 'package:my_food_app/widgets/large_text.dart';
import 'package:my_food_app/widgets/menu_list.dart';

import '../../utils/dimensions.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: Dimensions.height30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top:Dimensions.height30,bottom: Dimensions.height10,left:Dimensions.width30,right:Dimensions.width30),
              child: LargeText(text: "Menu")
            ),
            MenuList(),
          ],
        ),
      ),
    );
  }
}