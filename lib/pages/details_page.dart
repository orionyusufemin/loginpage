// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shoppingapp/models/product.dart';
import 'package:shoppingapp/pages/chart_page.dart';

class DetailsPage extends StatefulWidget {
  Product product;
  DetailsPage({super.key, required this.product});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isGraphVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: double.infinity,
                    child: Image(
                      image: NetworkImage(widget.product.image),
                      fit: BoxFit.fill,
                    )),
                Positioned(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Icons.favorite,
                          size: 36,
                          color: Colors.red,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Icons.share,
                          size: 36,
                          color: Colors.green,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Icons.report,
                          size: 36,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  top: 2,
                  right: 2,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                    widget.product.title,
                    style: TextStyle(fontSize: 24),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                    "Category : " + widget.product.category,
                    style: TextStyle(fontSize: 14),
                  )),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RatingBar.builder(
                  updateOnDrag: false,
                  tapOnlyMode: true,
                  ignoreGestures: true,
                  initialRating: double.parse(
                      widget.product.rating.rate.toString().split(".")[0]),
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                Text("(" + widget.product.rating.count.toString() + ")")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(40)),
                    child: GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Add to shopping cart",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChartPage(),
                          ));
                    },
                    child: Container(
                      decoration: BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "See graphs",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                  Icon(Icons.auto_graph_outlined)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
