import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_food_app/Screens/ProductPage/secondary_details_page.dart';
import 'package:my_food_app/data/data.dart';
import 'package:my_food_app/utils/dimensions.dart';
import 'package:my_food_app/widgets/action_icon_button.dart';
import 'package:my_food_app/widgets/item_count_small.dart';
import 'package:my_food_app/widgets/item_counter.dart';
import 'package:my_food_app/widgets/large_text.dart';
import 'package:my_food_app/widgets/cart_list.dart';
import 'package:my_food_app/widgets/small_text.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  int totalPrice = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: Dimensions.height45),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: Dimensions.width15, right: Dimensions.width15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: ActionIconButton(
                      icon: Icons.arrow_back_ios,
                      backgroundColor: Colors.blue,
                      IconColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  LargeText(text: "Shopping Cart"),
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            Expanded(
                child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("ShoppingCart")
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                      child: LargeText(
                    text: "Shopping Cart is Empty",
                  ));
                } else {
                  var data = snapshot.data?.docs;
                  totalPrice = 0;
                  data?.forEach((element) {
                    int id = int.parse(element.data()["id"]);
                    int count = element.data()["count"];
                    int price = int.parse(dataClass.mainlist[id]["price"]!);
                    totalPrice += (count * price);
                  });
                  return Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data?.length,
                              itemBuilder: (context, index) => InkWell(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SecondaryDetailsPage(
                                                    index: index)),
                                      ),
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: Dimensions.width20,
                                          right: Dimensions.width20,
                                          bottom: Dimensions.height10),
                                      child: Row(children: [
                                        Container(
                                          width: Dimensions.height120,
                                          height: Dimensions.height120,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions
                                                          .BorderRadius15),
                                              color: Colors.lightBlue,
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                    dataClass.mainlist[
                                                        int.parse(data?[index]
                                                            ["id"])]["image"]!,
                                                  ))),
                                        ),
                                        Expanded(
                                          child: Container(
                                            //margin: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                                            height: Dimensions.height100,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  spreadRadius: 3,
                                                  blurRadius: 10,
                                                  offset: Offset(0, 3),
                                                ),
                                              ],
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                    Dimensions.BorderRadius15),
                                                bottomRight: Radius.circular(
                                                    Dimensions.BorderRadius15),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: Dimensions.width10,
                                                  right: Dimensions.width10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  LargeText(
                                                      text: dataClass.mainlist[
                                                              int.parse(
                                                                  data?[index]
                                                                      ["id"])]
                                                          ['name']!),
                                                  SizedBox(
                                                    height: Dimensions.width10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      itemCountSmall(count: data![index]["count"]),
                                                      SmallText(
                                                        text: "Rs." +
                                                            dataClass.mainlist[int
                                                                    .parse(data?[
                                                                            index]
                                                                        ["id"])]
                                                                ["price"]!,
                                                        color: Colors.black,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: Dimensions.width10,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ),
                                  )),
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.all(Dimensions.height15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft:
                                    Radius.circular(Dimensions.height20 * 2),
                                topRight:
                                    Radius.circular(Dimensions.height20 * 2)),
                            color: Colors.grey[100]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LargeText(text: "Total Price: "),
                            LargeText(text: "Rs. " + totalPrice.toString()),
                          ],
                        ),
                      ),
                    ],
                  );
                }
              },
            )),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: Dimensions.height80,
        padding: EdgeInsets.only(
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: Dimensions.height10),
        decoration: BoxDecoration(
          color: Colors.grey[100],
        ),
        child: Container(
          padding: EdgeInsets.only(
              left: Dimensions.width15,
              right: Dimensions.width15,
              top: Dimensions.height20,
              bottom: Dimensions.height20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.height20),
            color: Colors.blue,
          ),
          child: Center(
            child: LargeText(
              text: "Checkout",
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
