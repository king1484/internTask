import 'package:flutter/material.dart';
import 'package:task/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void move() async {
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: ((context) => const LoginScreen())));
    }
  }

  @override
  void initState() {
    move();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          "assets/task_splash_screen.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset("assets/task_logo.png"))
      ],
    ));
  }
}
