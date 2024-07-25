// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange; //onemlı
  MyBottomNavBar({super.key, required this.onTabChange}); //onemlı

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GNav(
        onTabChange: (value) => onTabChange!(value), //onemlı
        padding: EdgeInsets.all(25),
        tabBorderRadius: 5,
        color: Colors.black,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        activeColor: Colors.black,
        //tabActiveBorder: Border.all(color: Colors.grey.shade700),
        tabBackgroundColor: Colors.deepPurple.shade100,
        tabs: [
          //onemlı
          GButton(
            icon: Icons.home,
            text: "Shop",
          ),
          GButton(
            icon: Icons.shopping_cart_rounded,
            text: "Cart",
          ),
          GButton(
            icon: Icons.person,
            text: "Your profile",
          ),
        ],
      ),
    );
  }
}
