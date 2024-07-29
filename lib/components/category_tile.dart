// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CategoryTile extends StatefulWidget {
  String url;
  String subTitle;
  CategoryTile({super.key, required this.url, required this.subTitle});

  @override
  State<CategoryTile> createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: Colors.black,
      child: ListTile(
        title: AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child:
                  Image(fit: BoxFit.contain, image: NetworkImage(widget.url))),
        ),
        subtitle: Expanded(
            child: Text(
          widget.subTitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
