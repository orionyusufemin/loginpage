import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shoppingapp/components/product_tile.dart';
import 'package:shoppingapp/models/Product.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key});

  @override
  State<CartPage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<CartPage> {
  bool isCartProductsFetched = false;
  List<Product> cartProducts = [];

  Future<void> getCartproducts(String category) async {
    String getCartProductsUrl = "https://fakestoreapi.com/carts/user/1";
    final response = await http.get(Uri.parse(getCartProductsUrl));
    if (response.statusCode == 200) {
      setState(() {
        List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;
        cartProducts = jsonList.map((json) => Product.fromJson(json)).toList();
        isCartProductsFetched = true;
      });
    } else {
      print("failed to fetch category products");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemBuilder: (context, index) {
        return ProductTile(products: cartProducts, index: index);
      },
      itemCount: cartProducts.length,
    ));
  }
}
