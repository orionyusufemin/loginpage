// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:shoppingapp/models/product.dart';
import 'package:shoppingapp/pages/chart_page.dart';
import 'package:shoppingapp/pages/details_page.dart';

class CartProductTile extends StatefulWidget {
  final List<Product> products;
  final int index;

  const CartProductTile({
    super.key,
    required this.products,
    required this.index,
  });

  @override
  State<CartProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<CartProductTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  //product clicked
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsPage(
                                product: widget.products[widget.index],
                              ),
                          fullscreenDialog: true));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Image(
                      fit: BoxFit.contain,
                      image: NetworkImage(widget.products[widget.index].image),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.shopping_cart),
                    Expanded(
                      child: Text(
                        widget.products[widget.index].title,
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.attach_money_rounded),
                    Text(
                      widget.products[widget.index].price.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 24),
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(25)),
              child: TextButton(
                  onPressed: () {
                    //delete clicked
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Product Successfully deleted"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Dismiss"))
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    "Delete From Cart",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
