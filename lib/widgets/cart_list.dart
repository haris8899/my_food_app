import 'package:flutter/material.dart';
import 'package:my_food_app/Screens/ProductPage/secondary_details_page.dart';
import 'package:my_food_app/data/data.dart';
import 'package:my_food_app/utils/dimensions.dart';
import 'package:my_food_app/widgets/large_text.dart';
import 'package:my_food_app/widgets/small_text.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: dataClass.mainlist.length,
                itemBuilder: (context, index) => InkWell(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondaryDetailsPage(index: index)),
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
                                      dataClass.mainlist[index]["image"]!,
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
                                        text: dataClass.mainlist[index]['name']!),
                                    SizedBox(
                                      height: Dimensions.width10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SmallText(
                                          text: "Rs." +
                                              dataClass.mainlist[index]["price"]!,
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
                    )),
      ),
    );
  }
}