import 'package:flutter/material.dart';
import 'package:my_food_app/utils/dimensions.dart';
import 'package:my_food_app/widgets/Text_Icon.dart';
import 'package:my_food_app/widgets/action_icon_button.dart';
import 'package:my_food_app/widgets/details_column.dart';
import 'package:my_food_app/widgets/expandable_text.dart';
import 'package:my_food_app/widgets/item_counter.dart';
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
                InkWell(
                  onTap:()=> Navigator.pop(context),
                  child: ActionIconButton(
                    icon: Icons.arrow_back_ios
                  ),
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
              padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.height20),
                  topRight: Radius.circular(Dimensions.height20)
                ),
                color: Colors.white, 
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailsColumn(text: "Food"),
                  SizedBox(height: Dimensions.height20,),
                  LargeText(text: "Introduction"),
                  Expanded(child: SingleChildScrollView(child: ExpandableText(text: "A shawarma is a popular Middle Eastern and Mediterranean dish that consists of thin slices of marinated meat, typically lamb, chicken, beef, or a combination thereof. The meat is stacked in a vertical rotisserie and slowly roasted as it turns on the heat source. This cooking method allows the outer layer of the meat to become crispy and caramelized, while the inner layers remain tender and juicy.")))
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
          bottom: Dimensions.height30
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.height20*2),
            topRight: Radius.circular(Dimensions.height20*2)
          ),
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
                  bottom: Dimensions.height20
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height20),
                color: Colors.blue,
              ),
              child: LargeText(text: "10\$ | Add to cart",color: Colors.white,),
            )
          ],
        ),
      ),
    );
  }
}