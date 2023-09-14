import 'package:flutter/material.dart';
import 'package:my_food_app/utils/dimensions.dart';
import 'package:my_food_app/widgets/action_icon_button.dart';
import 'package:my_food_app/widgets/item_counter.dart';
import 'package:my_food_app/widgets/large_text.dart';
import 'package:my_food_app/widgets/cart_list.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: Dimensions.height45),
        child: Column(
          children: [
             Container(
              margin: EdgeInsets.only(left: Dimensions.width15,right: Dimensions.width15),
               child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: ActionIconButton(icon: Icons.arrow_back_ios,backgroundColor: Colors.blue,IconColor: Colors.white,),
                    ),
                    SizedBox(width: Dimensions.width10,),
                    LargeText(text: "Shopping Cart"),
                  ],
                ),
             ),
              SizedBox(height: Dimensions.height20,),
              CartList(),
              
          ],
        ),
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
            LargeText(text: "Total Price"),
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
                text: "Checkout",
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}