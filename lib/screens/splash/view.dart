import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_guie/core/imgs.dart';
import 'package:my_guie/helpers/navigation.dart';
import 'package:my_guie/screens/home/view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2),
        () => RouteManager.navigateAndPopAll(const HomeScreen()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(pngName('logo')),
      ),
    );
  }
}
