import 'package:flutter/material.dart';
import 'package:my_guie/helpers/navigation.dart';
import 'package:my_guie/screens/splash/view.dart';

class MyGuide extends StatelessWidget {
  const MyGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Guide',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      onGenerateRoute: onGenerateRoute,
      theme: ThemeData(
        fontFamily: 'NotoSerif',
      ),
      home: const SplashScreen(),
    );
  }
}
