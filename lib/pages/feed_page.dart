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
  FeedPage({super.key,required this.currentUser});

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

    _pages = [ShopPage(), CartPage(id: widget.currentUser.id,), ProfilePage()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      backgroundColor: Colors.deepPurple.shade100,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar:
          MyBottomNavBar(onTabChange: (index) => navigateBottomBar(index)),
    );
  }
}
