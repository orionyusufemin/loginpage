// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String currentUser = "";
  bool isCurrentUserFetched = false;

  Future<void> getUsername() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    currentUser = sharedPreferences.getString("currentUser") ?? "johnd";
    setState(() {
      isCurrentUserFetched = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsername();
  }

  @override
  Widget build(BuildContext context) {
    return isCurrentUserFetched
        ? Column(
            children: [
              Center(
                child: CircleAvatar(
                    child: Icon(
                  Icons.person_3,
                  size: 36,
                )),
              ),
              Center(
                child: Text(
                  "Hi, " + currentUser,
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 36),
                ),
              ),
            ],
          )
        : CircularProgressIndicator(
            strokeWidth: 12,
          );
  }
}
