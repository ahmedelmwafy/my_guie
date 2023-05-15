import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_guie/helpers/cash.dart';
import 'package:my_guie/helpers/dio_helper.dart';
import 'package:my_guie/screens/material/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CashedHelper.init();
  await DioHelper.init();

  runApp(const MyGuide());
}
