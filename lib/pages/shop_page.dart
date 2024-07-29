// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shoppingapp/components/category_tile.dart';
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
  bool isMainPage = true;

  Future<void> getCategories() async {
    String categoriesUrl = "https://fakestoreapi.com/products/categories";
    final response = await http.get(Uri.parse(categoriesUrl));
    if (response.statusCode == 200&&mounted) {
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
    return isMainPage
        ? Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      "Have a nice day",
                      style: TextStyle(color: Colors.black, fontSize: 48),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  child: Expanded(
                    child: Text(
                      "Which category would you like to shop in?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 20,
                  crossAxisCount: 2, //cross axis=column
                  children: [
                    GestureDetector(
                      onTap: () async {
                        getProductsInCategory("electronics");
                        setState(() {
                          isMainPage = false;
                        });
                      },
                      child: CategoryTile(
                        url:
                            "https://ecelectronics.com/wp-content/uploads/2020/04/Modern-Electronics-EC-.jpg",
                        subTitle: "Electronics",
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        getProductsInCategory("jewelery");
                        setState(() {
                          isMainPage = false;
                        });
                      },
                      child: CategoryTile(
                          url:
                              "https://retailjewellerindia.com/wp-content/uploads/2022/02/Gold-jewellery-gold-ornaments-_16cccf0b0ce_medium.jpg",
                          subTitle: "Jewellery"),
                    ),
                    GestureDetector(
                      onTap: () async {
                        getProductsInCategory("men's clothing");
                        setState(() {
                          isMainPage = false;
                        });
                      },
                      child: CategoryTile(
                          url:
                              "https://www.alanic.com/blog/wp-content/uploads/2015/07/category6.jpg",
                          subTitle: "Men's Clothing"),
                    ),
                    GestureDetector(
                      onTap: () async {
                        getProductsInCategory("women's clothing");
                        setState(() {
                          isMainPage = false;
                        });
                      },
                      child: CategoryTile(
                          url:
                              "https://www.thestreet.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTk0NjMxNTE0MzAwODg0MTMw/shopping-rack-lead-js-122222.jpg",
                          subTitle: "Women's clothing"),
                    ),
                  ],
                ),
              )
            ],
          )
        : isProductsFetched
            ? Expanded(
                child: ListView.builder(
                itemBuilder: (context, index) {
                  return ProductTile(products: products, index: index);
                },
                itemCount: products.length,
              ))
            : Text("failed to fetch products in category");
  }
}
