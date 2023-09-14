import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_food_app/Screens/HomePage/main_home_page.dart';
import 'package:my_food_app/Screens/ProductPage/menu_page.dart';
import 'package:my_food_app/Screens/UserScreens/user_frame.dart';
import 'package:my_food_app/Screens/UserScreens/user_signin_screen.dart';
import 'package:my_food_app/utils/dimensions.dart';

class NavigationFrame extends StatefulWidget {
  const NavigationFrame({super.key});

  @override
  State<NavigationFrame> createState() => _NavigationFrameState();
}

class _NavigationFrameState extends State<NavigationFrame> {
  int _currentIndex = 0;
  final MainScreens = [
    MainHomePage(),
    MenuPage(),
    UserFrame(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainScreens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue[100],
        selectedItemColor: Colors.blue,
        iconSize: Dimensions.height30,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "Menu",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Profile",
            backgroundColor: Colors.green,
          ),
        ],
        onTap: (index) => {
          setState(() => _currentIndex = index),
        },
      ),
    );
  }
}
