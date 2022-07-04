import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task/home_screen.dart';
import 'package:task/signup_screen.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisible = true;
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();

  void login() async {
    if (c1.text.isEmpty || c2.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Enter all the fields")));
    } else {
      //login code
      var res = await http.post(
          Uri.parse("https://app-dev-task.herokuapp.com/users/login"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"email": c1.text, "password": c2.text}));
      var resJson = jsonDecode(res.body);
      if (resJson.containsKey("msg")) {
        if (mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(resJson["msg"])));
        }
      } else {
        await http.put(
            Uri.parse(
                "https://app-dev-task.herokuapp.com/users/notificationToken"),
            headers: {
              "Content-Type": "application/json",
              "x-auth-token": resJson["token"]
            },
            body: jsonEncode({"user_id": resJson["user"]["_id"]}));
        if (mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Login success")));
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeScreen(
                        token: resJson["token"],
                      )));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "assets/task_login_vector.png",
                height: 250,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                "Let's Sign You In.",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 10),
              child: Text(
                "Welcome back.\nYou have been missed!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: TextField(
                controller: c1,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    label: const Text("Email"),
                    labelStyle: TextStyle(color: Colors.grey[600]),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: TextField(
                controller: c2,
                obscureText: isVisible,
                decoration: InputDecoration(
                    suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        child: isVisible
                            ? Icon(
                                Icons.visibility,
                                color: Colors.grey[600],
                              )
                            : Icon(
                                Icons.visibility_off,
                                color: Colors.grey[600],
                              )),
                    filled: true,
                    fillColor: Colors.grey[200],
                    label: const Text("Password"),
                    labelStyle: TextStyle(color: Colors.grey[600]),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  width: 2,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupScreen()));
                  },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                        color: Colors.amber, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: RawMaterialButton(
                  onPressed: () {
                    login();
                  },
                  fillColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                    "Sign in",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
