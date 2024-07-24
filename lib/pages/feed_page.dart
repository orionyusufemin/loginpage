import 'package:flutter/material.dart';
import 'package:shoppingapp/components/bottom_nav_bar.dart';
import 'package:shoppingapp/pages/profile_page.dart';
import 'package:shoppingapp/pages/shop_page.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  int _selectedIndex = 0; 

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
      ProfilePage()
    ];
    
  }
  @override
    Widget build(BuildContext context) {
      return Scaffold(body: _pages[_selectedIndex],
      bottomNavigationBar: MyBottomNavBar(onTabChange: (index) => navigateBottomBar(index)),
      );
    }
}
