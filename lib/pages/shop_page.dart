// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shoppingapp/components/product_tile.dart';
import 'package:shoppingapp/models/product.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<dynamic> categoryNameList = [];
  List<Product> products = [];
  bool isProductsFetched = false;

  Future<void> getCategories() async {
    String categoriesUrl = "https://fakestoreapi.com/products/categories";
    final response = await http.get(Uri.parse(categoriesUrl));
    if (response.statusCode == 200) {
      setState(() {
        categoryNameList = jsonDecode(response.body) as List<dynamic>;
      });
    } else {
      print("failed when fetching categories");
    }
  }

  Future<void> getProductsInCategory(String category) async {
    String getProductsInCategoryUrl =
        "https://fakestoreapi.com/products/category/${category}";
    final response = await http.get(Uri.parse(getProductsInCategoryUrl));
    if (response.statusCode == 200) {
      setState(() {
        List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;
        products = jsonList.map((json) => Product.fromJson(json)).toList();
        isProductsFetched = true;
      });
    } else {
      print("failed to fetch category products");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 70,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  getProductsInCategory(categoryNameList[index]);
                  print(categoryNameList[index] + isProductsFetched.toString());
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(7)),
                    child: Text(
                      categoryNameList[index].toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              );
            },
            itemCount: categoryNameList.length,
          ),
        ),
        isProductsFetched
            ? Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ProductTile(products: products, index: index);
                    },
                    itemCount: products.length,
                  ),
                ),
              )
            : Text("select category")
      ],
    );
  }
}
