// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppingapp/pages/feed_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoginPage = false;
  bool isDone = false;
  bool isChecked = false;
  bool passwordVisible = false;
  String firstName = "";
  String lastName = "";
  String username = "";
  String password = "";
  String confirmedPassword = "";
  var _controller = TextEditingController();

  Future<void> login(String username, String password) async {
    String loginUrl = "https://fakestoreapi.com/auth/login";
    final response = await http.post(Uri.parse(loginUrl),
        body: {"username": username, "password": password});
    if (response.statusCode == 200) {
      //user logged in
      print("User logged in");
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      bool isLoggedIn = await sharedPreferences.setBool("isLoggedIn", true);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => FeedPage(),
          ));
    } else {
      //failed
      print("failed");
    }
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isLoggedIn = sharedPreferences.getBool("isLoggedIn") ?? false;
    if (isLoggedIn) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => FeedPage(),
          ));
      setState(() {
        isDone = true;
      });
    } else {
      //user not logged in yet.
      setState(() {
        isDone = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: isDone
            ? isLoginPage
                ? Column(
                    children: [
                      Center(
                        child: Container(
                          padding: EdgeInsets.only(top: 70),
                          child: Text(
                            "Hey there,",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 35),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          padding: EdgeInsets.only(top: 13),
                          child: Text(
                            "Welcome back!",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            hintText: "E-mail",
                            floatingLabelAlignment:
                                FloatingLabelAlignment.start,
                            fillColor: Colors.grey.shade100,
                            filled: true,
                          ),
                          onChanged: (value) {
                            username = value;
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 8.0, right: 8, top: 10),
                        child: TextFormField(
                          obscureText: passwordVisible,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              child: passwordVisible
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              onTap: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            hintText: "Password",
                            prefixIcon: Icon(Icons.password),
                            fillColor: Colors.grey.shade100,
                            filled: true,
                          ),
                          onChanged: (value) {
                            password = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot your password?",
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 24,
                              ),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.purple),
                          child: TextButton(
                              onPressed: () {
                                //login clicked
                                login(username, password);
                              },
                              child: Text(
                                "LOG IN",
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "LOGIN",
                              style: TextStyle(
                                  fontSize: 56, fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.add,
                              size: 56,
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Dont have an account yet ?",
                          ),
                          TextButton(
                              onPressed: () {
                                //login page direction
                                setState(() {
                                  isLoginPage = false;
                                });
                              },
                              child: Text("Register"))
                        ],
                      )
                    ],
                  )
                : Column(
                    children: [
                      Center(
                        child: Container(
                          padding: EdgeInsets.only(top: 30),
                          child: Text(
                            "Hey there,",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 35),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            "Create an account",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                              hintText: "First Name",
                              prefixIcon: Icon(Icons.person),
                              fillColor: Colors.grey.shade100,
                              filled: true),
                          onChanged: (value) {
                            firstName = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                              hintText: "Last Name",
                              prefixIcon: Icon(Icons.person),
                              fillColor: Colors.grey.shade100,
                              filled: true),
                          onChanged: (value) {
                            lastName = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            hintText: "E-mail",
                            prefixIcon: Icon(Icons.email),
                            fillColor: Colors.grey.shade100,
                            filled: true,
                          ),
                          onChanged: (value) {
                            username = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          obscureText: passwordVisible,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              child: passwordVisible
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              onTap: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            hintText: "Password",
                            prefixIcon: Icon(Icons.password),
                            fillColor: Colors.grey.shade100,
                            filled: true,
                          ),
                          onChanged: (value) {
                            password = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          obscureText: passwordVisible,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              child: passwordVisible
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              onTap: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            hintText: "Confirm password",
                            prefixIcon: Icon(Icons.password),
                            fillColor: Colors.grey.shade100,
                            filled: true,
                          ),
                          onChanged: (value) {
                            confirmedPassword = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (newBool) {
                                setState(() {
                                  isChecked = newBool!;
                                });
                                print(isChecked);
                              },
                            ),
                            Text(
                              "By clicking this button, you confirm that\n your data may be shared by our partners.",
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.purple),
                          child: TextButton(
                              onPressed: () {
                                //create account
                                if (isChecked == true &&
                                    firstName.isNotEmpty &&
                                    lastName.isNotEmpty &&
                                    password.isNotEmpty &&
                                    confirmedPassword.isNotEmpty &&
                                    password == confirmedPassword) {
                                  print("user created");
                                }
                              },
                              child: Text(
                                "REGISTER",
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "LOGIN",
                              style: TextStyle(
                                  fontSize: 56, fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.add,
                              size: 56,
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account ?",
                          ),
                          TextButton(
                              onPressed: () {
                                //login page direction
                                setState(() {
                                  isLoginPage = true;
                                });
                              },
                              child: Text("Log in"))
                        ],
                      )
                    ],
                  )
            : CircularProgressIndicator());
  }
}


/*

FutureBuilder(
        future: fetchUser("john@gmail.com", "m38rmF\$"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(
              strokeWidth: 12,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("hata"),
            );
          } else if (snapshot.hasData) {
            return Center(
              child: Text("girildi"),
            );
          } else {
            return Text("ters");
          }
        },
      )
 */