// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shoppingapp/components/bottom_nav_bar.dart';
import 'package:shoppingapp/models/User.dart';
import 'package:shoppingapp/pages/cart_page.dart';
import 'package:shoppingapp/pages/profile_page.dart';
import 'package:shoppingapp/pages/shop_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeedPage extends StatefulWidget {
  User currentUser;
  FeedPage({super.key, required this.currentUser});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  bool isCurrentUserFetched = false;

  int _selectedIndex = 0;

  User? currentUser;

  void navigateBottomBar(int index) {
    if (mounted) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _pages = [
      ShopPage(),
      CartPage(
        id: widget.currentUser.id,
      ),
      ProfilePage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.grey.shade100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Shopping App",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              "Hey ${widget.currentUser.name.firstname}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.w200),
            ),
            Text(
              "Good to See you",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w200),
            ),
            Card(
              color: Colors.black,
              child: ListTile(
                leading: Icon(
                  Icons.logout_rounded,
                  color: Colors.white,
                ),
                title: Text(
                  "Log out",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            //menu icon pressed
          },
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
              onPressed: () {
                //info icon pressed
              },
              icon: Icon(Icons.info))
        ],
      ),
      bottomNavigationBar:
          MyBottomNavBar(onTabChange: (index) => navigateBottomBar(index)),
    );
  }
}
