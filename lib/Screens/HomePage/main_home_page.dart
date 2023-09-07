import 'package:flutter/material.dart';
import 'package:my_food_app/Screens/HomePage/home_page_body.dart';
import 'package:my_food_app/Screens/Orders/shopping_cart.dart';
import 'package:my_food_app/utils/dimensions.dart';
import 'package:my_food_app/widgets/icon_button.dart';
import 'package:my_food_app/widgets/large_text.dart';
import 'package:my_food_app/widgets/small_text.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.TopGap, bottom: Dimensions.BorderRadius15),
              padding: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      LargeText(
                        text: "Country",
                        color: Colors.blue,
                        size: Dimensions.icon24,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: "City",
                            color: Colors.black,
                          ),
                          Icon(Icons.arrow_drop_down_rounded),
                        ],
                      ),
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        BlueIconButton(icon: Icons.search),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        InkWell(
                            onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ShoppingCart()),
                                  ),
                                },
                            child: BlueIconButton(icon: Icons.shopping_cart)),
                      ],
                    )
                  ]),
            ),
          ),
          Expanded(child: SingleChildScrollView(child: HomePageBody())),
        ],
      ),
    );
  }
}
