// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, sort_child_properties_last

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppingapp/models/user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late User currentUser;
  bool isCurrentUserFetched = false;

  Future<void> getCurrentUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    currentUser =
        User.fromJson(jsonDecode(sharedPreferences.getString("currentUser")!));

    setState(() {
      isCurrentUserFetched = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return isCurrentUserFetched
        ? Column(
            children: [
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://st3.depositphotos.com/15648834/17930/v/950/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg")),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                ),
              ),
              Center(
                child: Text(
                  "Hi, " +
                      currentUser.name.firstname +
                      " " +
                      currentUser.name.lastname,
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 36),
                ),
              ),
              Card()
            ],
          )
        : CircularProgressIndicator(
            strokeWidth: 12,
          );
  }
}
