import 'package:flutter/material.dart';
import 'package:my_food_app/HomePage/home_page_body.dart';
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
            margin: EdgeInsets.only(top: 55,bottom: 15),
            padding: EdgeInsets.only(left: 20,right: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    LargeText( text: "Country",color: Colors.blue,size: 25,),
                    Row(
                      children: [
                        SmallText(text: "City",color: Colors.black,),
                        Icon(Icons.arrow_drop_down_rounded),
                      ],
                    ),
                  ]),
                  Center(
                    child: Container(
                      width: 45,
                      height: 45,
                      child: Icon(Icons.search, color: Colors.white,),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue,
                      ),
                    ),
                  )
                ]),
          ),
        ),
        HomePageBody(),
      ],
    ),
  );
  }
}
