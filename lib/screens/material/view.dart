import 'package:flutter/material.dart';
import 'package:my_guie/core/color.dart';
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
          scaffoldBackgroundColor: kWhiteColor,
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(
                color: kMainColor, // Set your desired icon color here
              ),
              titleTextStyle: TextStyle(
                color: kMainColor,
              ),
              color: kWhiteColor,
              elevation: 0)),
      home: const SplashScreen(),
    );
  }
}
