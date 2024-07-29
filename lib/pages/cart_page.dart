import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shoppingapp/components/cart_product_tile.dart';
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
  List<Product> realCartProducts = [];

  Future<void> getCartproducts() async {
    String getCartProductsUrl = "https://fakestoreapi.com/carts/user/1";
    final response = await http.get(Uri.parse(getCartProductsUrl));
    if (response.statusCode == 200 && mounted) {
      setState(() {
        List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;
        cartProducts =
            jsonList.map((json) => CartProduct.fromJson(json)).toList();

        for (int i = 0; i < cartProducts[0].products.length; i++) {
          int productId = cartProducts[0].products[i].productId;
          getProduct(productId);
        }
        isCartProductsFetched = true;
      });
    } else {
      print("failed to fetch category products");
    }
  }

  Future<void> getProduct(int id) async {
    String url = "https://fakestoreapi.com/products/${id}";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200&& mounted) {
      setState(() {
        Product product = Product.fromJson(jsonDecode(response.body));
        realCartProducts.add(product);
      });
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
    return isCartProductsFetched
        ? ListView.builder(
            itemBuilder: (context, index) {
              return CartProductTile(products: realCartProducts, index: index);
            },
            itemCount: realCartProducts.length,
          )
        : Text("yuklenmekte");
  }
}
//Text(cartProducts[0].products[1].productId.toString())