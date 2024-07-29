// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatefulWidget {
  void Function(int)? onTabChange; //onemlı
  MyBottomNavBar({super.key, required this.onTabChange});
  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  bool isHomeSelected = true;

  bool isCartSelected = false;

  bool isProfileSelected = false;

  //onemlı
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GNav(
        onTabChange: (value) => widget.onTabChange!(value), //onemlı
        padding: EdgeInsets.only(left: 10, right: 10, top: 15),
        tabBorderRadius: 5,
        color: Colors.black,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        activeColor: Colors.black,

        tabBackgroundColor: Colors.grey.shade100,
        tabs: [
          //onemlı
          GButton(
            onPressed: () {
              if (isHomeSelected == false) {
                setState(() {
                  isHomeSelected = true;
                  isCartSelected = false;
                  isProfileSelected = false;
                });
              }
            },
            icon: isHomeSelected ? Icons.home : Icons.home_outlined,
            iconSize: 40,
            text: "",
          ),
          GButton(
            onPressed: () {
              if (isCartSelected == false) {
                setState(() {
                  isHomeSelected = false;
                  isCartSelected = true;
                  isProfileSelected = false;
                });
              }
            },
            icon: isCartSelected
                ? Icons.shopping_bag
                : Icons.shopping_bag_outlined,
            iconSize: 40,
            text: "",
          ),
          GButton(
            onPressed: () {
              if (isProfileSelected == false) {
                setState(() {
                  isHomeSelected = false;
                  isCartSelected = false;
                  isProfileSelected = true;
                });
              }
            },
            icon: isProfileSelected ? Icons.person_2 : Icons.person_2_outlined,
            iconSize: 40,
            text: "",
          ),
        ],
      ),
    );
  }
}
