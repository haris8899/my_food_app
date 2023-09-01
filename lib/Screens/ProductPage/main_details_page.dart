import 'package:flutter/material.dart';
import 'package:my_food_app/data/data.dart';
import 'package:my_food_app/utils/dimensions.dart';
import 'package:my_food_app/widgets/Text_Icon.dart';
import 'package:my_food_app/widgets/action_icon_button.dart';
import 'package:my_food_app/widgets/details_column.dart';
import 'package:my_food_app/widgets/expandable_text.dart';
import 'package:my_food_app/widgets/item_counter.dart';
import 'package:my_food_app/widgets/large_text.dart';
import 'package:my_food_app/widgets/small_text.dart';

class MainDetailsPage extends StatelessWidget {
  final int index;
  const MainDetailsPage({super.key, required this.index});

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
                      dataClass.Featured[index]["image"]!,
                    )),
              ),
            ),
          ),
          Positioned(
            top: Dimensions.TopGap,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: ActionIconButton(icon: Icons.arrow_back_ios),
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
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.height20),
                    topRight: Radius.circular(Dimensions.height20)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailsColumn(text: dataClass.Featured[index]["name"]!),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  LargeText(text: "Introduction"),
                  Expanded(
                      child: SingleChildScrollView(
                          child: ExpandableText(
                              text:dataClass.Featured[index]['description']!)))
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.pageViewTextContainer,
        padding: EdgeInsets.only(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height30,
            bottom: Dimensions.height30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.height20 * 2),
              topRight: Radius.circular(Dimensions.height20 * 2)),
          color: Colors.grey[100],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ItermCounterWidget(),
            Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20,
                  bottom: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height20),
                color: Colors.blue,
              ),
              child: LargeText(
                text: "Rs. "+dataClass.Featured[index]["price"]!+" | Add to cart",
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
