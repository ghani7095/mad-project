import 'package:flutter/material.dart';
import 'package:tokd/images.dart';
import 'package:tokd/screens/starterlogin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key, // Add 'Key?' to fix the constructor
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay navigation to LoginScreen by 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginFirstScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: currentTheme.secondaryHeaderColor,
      body: Center(
        child: Image.asset(
          logoimage,
          height: size.height * 0.35,
          width: size.width * 0.35,
        ),
      ),
    );
  }
}
