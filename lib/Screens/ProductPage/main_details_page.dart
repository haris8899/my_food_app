import 'package:flutter/material.dart';
import 'package:my_food_app/utils/dimensions.dart';
import 'package:my_food_app/widgets/Text_Icon.dart';
import 'package:my_food_app/widgets/action_icon_button.dart';
import 'package:my_food_app/widgets/details_column.dart';
import 'package:my_food_app/widgets/large_text.dart';
import 'package:my_food_app/widgets/small_text.dart';

class MainDetailsPage extends StatelessWidget {
  const MainDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.height300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/food1.png",
                  )
                ),
              ),
            ),
          ),
          Positioned(
            top:Dimensions.TopGap,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionIconButton(
                  icon: Icons.arrow_back_ios
                ),
                ActionIconButton(
                  icon: Icons.shopping_cart_outlined,
                )
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.height300 - Dimensions.height20,
            child: DetailsColumn(text: "Food"),
          ),
        ],
      ),
    );
  }
}