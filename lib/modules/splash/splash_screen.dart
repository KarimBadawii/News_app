import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/BgWidget.dart';
import 'package:news_app/modules/home/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = "splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // void initState() {
  //   Timer(Duration(seconds: 5), () {
  //     Navigator.pushNamedAndRemoveUntil(
  //         context, HomeScreen.routeName, (route) => false);
  //   });
  //   super.initState();
  // }

  // void initState(){
  //   super.initState();
  //   Future.delayed(const Duration(seconds: 3 )).then((_){
  //     Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
  //   });
  // }
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BgWidget(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
              child: Bounce(child: Image.asset("assets/images/logo.png")))),
    );
  }
}
