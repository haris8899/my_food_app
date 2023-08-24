import 'package:flutter/material.dart';
import 'package:my_food_app/utils/dimensions.dart';
import 'package:my_food_app/widgets/Text_Icon.dart';
import 'package:my_food_app/widgets/large_text.dart';
import 'package:my_food_app/widgets/small_text.dart';

class DetailsColumn extends StatelessWidget {
  final String text;
  const DetailsColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LargeText(text: text,size: Dimensions.height25,),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                color: Colors.blue,
                                size: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(text: "4.5"),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(text: "12.2k"),
                          SizedBox(
                            width: 5,
                          ),
                          SmallText(text: "comments"),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextIcon(
                            icon: Icons.circle_sharp,
                            text: 'Normal',
                            iconColor: Colors.amber,
                          ),
                          TextIcon(
                              icon: Icons.location_on,
                              text: "1.7 Km",
                              iconColor: Colors.red),
                          TextIcon(
                              icon: Icons.access_time_outlined,
                              text: "20 min",
                              iconColor: Colors.red),
                        ],
                      ),
                    ]);
  }
}