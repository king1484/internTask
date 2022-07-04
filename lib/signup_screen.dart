import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task/home_screen.dart';
import 'package:task/login_screen.dart';
import 'package:http/http.dart' as http;

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isVisible = true;
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();
  TextEditingController c4 = TextEditingController();
  TextEditingController c5 = TextEditingController();
  TextEditingController c6 = TextEditingController();
  TextEditingController c7 = TextEditingController();

  void signup() async {
    if (c1.text.isEmpty ||
        c2.text.isEmpty ||
        c3.text.isEmpty ||
        c4.text.isEmpty ||
        c5.text.isEmpty ||
        c6.text.isEmpty ||
        c7.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Enter all the fields")));
    } else {
      //signup code
      var res = await http.post(
          Uri.parse("https://app-dev-task.herokuapp.com/users/register"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "email": c6.text,
            "password": c7.text,
            "passwordCheck": c7.text,
            "first_name": c1.text,
            "last_name": c2.text,
            "username": c5.text,
            "phone_number": c3.text
          }));
      var resJson = jsonDecode(res.body);
      if (resJson.containsKey("msg")) {
        if (mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(resJson["msg"])));
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Signup success! Login to continue")));
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
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
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                "Sign Up Now.",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 10),
              child: Text(
                "Sign up to use the app.",
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
                    label: const Text("First name"),
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
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    label: const Text("Last name"),
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
                controller: c3,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    label: const Text("Phone number"),
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
                controller: c4,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    label: const Text("Address"),
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
                controller: c5,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    label: const Text("Username"),
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
                controller: c6,
                keyboardType: TextInputType.emailAddress,
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
                controller: c7,
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
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
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
                            builder: (context) => const LoginScreen()));
                  },
                  child: const Text(
                    "Sign in",
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
                    signup();
                  },
                  fillColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                    "Sign up",
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
