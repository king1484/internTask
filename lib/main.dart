import 'package:flutter/material.dart';
import 'package:task/home_screen.dart';
import 'package:task/login_screen.dart';
import 'package:task/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Delisol",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
