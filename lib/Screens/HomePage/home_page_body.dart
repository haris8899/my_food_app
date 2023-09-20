import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:my_food_app/Screens/Orders/cart_functions.dart';
import 'package:my_food_app/Screens/ProductPage/secondary_details_page.dart';
import 'package:my_food_app/data/data.dart';
import 'package:my_food_app/utils/dimensions.dart';
import 'package:my_food_app/widgets/Text_Icon.dart';
import 'package:my_food_app/widgets/details_column.dart';
import 'package:my_food_app/widgets/large_text.dart';
import 'package:my_food_app/widgets/small_text.dart';

import '../ProductPage/main_details_page.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(children: [
            LargeText(text: "Featured"),
          ]),
        ),
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          height: Dimensions.pageViewMainContainer,
          child: PageView.builder(
              controller: pageController,
              itemCount: dataClass.Featured.length,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        DotsIndicator(
          dotsCount: dataClass.Featured.length,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: Colors.blue,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(children: [
            LargeText(text: "Popular"),
          ]),
        ),
        ListView.builder(
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    LargeText(
                                        text: dataClass.mainlist[index]['name']!),
                                    InkWell(
                                      onTap: () => CartFunctions.addToCart(index.toString(), 1),
                                      child: Container(
                                        padding: EdgeInsets.all(Dimensions.height10/2),
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.circular(Dimensions.height30)
                                        ),
                                        child: Icon(Icons.add,color: Colors.white,),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: Dimensions.width10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
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
                                      ],
                                    ),
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
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      ;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      ;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }
    return Transform(
      transform: matrix,
      child: InkWell(
        onTap: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MainDetailsPage(index: index))),
        },
        child: Stack(
          children: [
            Container(
                //child:Text(index.toString()),
                height: Dimensions.pageViewContainer,
                margin: EdgeInsets.only(
                    left: Dimensions.width10, right: Dimensions.width10),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Dimensions.BorderRadius30),
                  color: index.isEven ? Colors.blue : Colors.amber,
                  border: Border.all(color: Colors.grey),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(dataClass.Featured[index]['image']!)),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimensions.pageViewTextContainer,
                margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Dimensions.BorderRadius30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 8,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height15, left: 15, right: 15),
                  child:
                      DetailsColumn(text: dataClass.Featured[index]["name"]!),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
