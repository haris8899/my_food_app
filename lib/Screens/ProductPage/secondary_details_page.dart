import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_food_app/data/data.dart';
import 'package:my_food_app/utils/dimensions.dart';
import 'package:my_food_app/widgets/action_icon_button.dart';
import 'package:my_food_app/widgets/expandable_text.dart';
import 'package:my_food_app/widgets/item_counter.dart';
import 'package:my_food_app/widgets/large_text.dart';
import 'package:my_food_app/widgets/small_text.dart';

class SecondaryDetailsPage extends StatelessWidget {
  final int index;
  const SecondaryDetailsPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: Dimensions.height80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () => Navigator.pop(context),
                    child: ActionIconButton(icon: Icons.close)),
                ActionIconButton(icon: Icons.shopping_cart),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.height30),
              child: Container(
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  padding: EdgeInsets.only(
                    left: Dimensions.width10,
                    right: Dimensions.width10,
                    top: Dimensions.height10,
                    bottom: Dimensions.height10,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.BorderRadius15),
                        topRight: Radius.circular(Dimensions.BorderRadius15),
                      )),
                  child: LargeText(
                    text: dataClass.mainlist[index]["name"]!,
                    size: Dimensions.height25,
                  )),
            ),
            pinned: true,
            backgroundColor: Colors.lightGreen,
            expandedHeight: Dimensions.height300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                dataClass.mainlist[index]["image"]!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
                  decoration: BoxDecoration(),
                  child: ExpandableText(
                      text: dataClass.mainlist[index]["description"]!),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          padding: EdgeInsets.only(
              left: Dimensions.width30 * 2, right: Dimensions.width30 * 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ActionIconButton(
                iconSize: Dimensions.icon24,
                icon: Icons.remove,
                backgroundColor: Colors.blue,
                IconColor: Colors.white,
              ),
              LargeText(
                text: "1 " + " X " + "Rs."+dataClass.mainlist[index]["price"]!,
                size: Dimensions.height25,
              ),
              ActionIconButton(
                iconSize: Dimensions.icon24,
                icon: Icons.add,
                backgroundColor: Colors.blue,
                IconColor: Colors.white,
              ),
            ],
          ),
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Container(
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
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 8,
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ],
            color: Colors.blue[100],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20,
                    bottom: Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.height20),
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.favorite,
                  color: Colors.pink,
                ),
              ),
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
                  text: "Rs."+dataClass.mainlist[index]['price']! +" | Add to cart",
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
