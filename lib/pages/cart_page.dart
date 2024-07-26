import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shoppingapp/components/product_tile.dart';
import 'package:shoppingapp/models/product.dart';
import 'package:shoppingapp/models/cart_product.dart';

class CartPage extends StatefulWidget {
  int id;
  CartPage({super.key, required this.id});

  @override
  State<CartPage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<CartPage> {
  bool isCartProductsFetched = false;
  List<CartProduct> cartProducts = [];

  Future<void> getCartproducts() async {
    String getCartProductsUrl =
        "https://fakestoreapi.com/carts/user/${widget.id}";
    final response = await http.get(Uri.parse(getCartProductsUrl));
    if (response.statusCode == 200) {
      setState(() {
        List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;
        cartProducts = jsonList.map((json) => CartProduct.fromJson(json)).toList();
        isCartProductsFetched = true;
        print(cartProducts.toString());
      });
    } else {
      print("failed to fetch category products");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCartproducts();
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget.id.toString());
  }
}
