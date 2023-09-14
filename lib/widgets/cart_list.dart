import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_food_app/Screens/Orders/cart_functions.dart';
import 'package:my_food_app/Screens/ProductPage/secondary_details_page.dart';
import 'package:my_food_app/data/data.dart';
import 'package:my_food_app/utils/dimensions.dart';
import 'package:my_food_app/widgets/item_counter.dart';
import 'package:my_food_app/widgets/large_text.dart';
import 'package:my_food_app/widgets/small_text.dart';

class CartList extends StatefulWidget {
  CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  var func = new CartFunctions();
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: StreamBuilder(
      stream: FirebaseFirestore.instance.collection("ShoppingCart").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
              child: LargeText(
            text: "Shopping Cart is Empty",
          ));
        } else {
          var data = snapshot.data?.docs;
          return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data?.length,
              itemBuilder: (context, index) => InkWell(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SecondaryDetailsPage(index: index)),
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
                              borderRadius: BorderRadius.circular(
                                  Dimensions.BorderRadius15),
                              color: Colors.lightBlue,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    dataClass.mainlist[
                                            int.parse(data?[index]["id"])]
                                        ["image"]!,
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
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 8,
                                  blurRadius: 10,
                                  offset: Offset(0, 3),
                                ),
                              ],
                              borderRadius: BorderRadius.only(
                                topRight:
                                    Radius.circular(Dimensions.BorderRadius15),
                                bottomRight:
                                    Radius.circular(Dimensions.BorderRadius15),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: Dimensions.width10,
                                  right: Dimensions.width10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  LargeText(
                                      text: dataClass.mainlist[
                                              int.parse(data?[index]["id"])]
                                          ['name']!),
                                  SizedBox(
                                    height: Dimensions.width10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SmallText(text: data![index]["count"].toString()),
                                      SmallText(
                                        text: "Rs." +
                                            dataClass.mainlist[int.parse(
                                                data?[index]["id"])]["price"]!,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Dimensions.width10,
                                  ),
                                  // Row(
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     TextIcon(
                                  //       icon: Icons.circle_sharp,
                                  //       text: 'Normal',
                                  //       iconColor: Colors.amber,
                                  //     ),
                                  //     TextIcon(
                                  //         icon: Icons.location_on,
                                  //         text: "1.7 Km",
                                  //         iconColor: Colors.red),
                                  //     TextIcon(
                                  //         icon: Icons.access_time_outlined,
                                  //         text: "20 min",
                                  //         iconColor: Colors.red),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ));
        }
      },
    ));
  }
}
