import 'dart:async';

import 'package:book_app/screens/home_screen.dart';
import 'package:book_app/screens/login/login_screen.dart';
import 'package:book_app/screens/login/sigin_screen.dart';
import 'package:flutter/material.dart';

import 'navigator_tab.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(seconds: 2), (timer) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const NavivatorTabCustom(),

      ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image:  AssetImage('images/boook.jpg'),
          fit: BoxFit.contain,
        )

      ),
      ),
    );
  }
}
