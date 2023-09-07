import 'package:flutter/material.dart';
import 'package:my_food_app/Screens/Orders/shopping_cart.dart';
import 'package:my_food_app/widgets/icon_button.dart';
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LargeText(text: "Menu"),
                  InkWell(
                    onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ShoppingCart()),
                                  ),
                                },
                    child: BlueIconButton(icon: Icons.shopping_cart)
                  ),
                ],
              )
            ),
            MenuList(),
          ],
        ),
      ),
    );
  }
}