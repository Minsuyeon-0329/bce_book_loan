import 'package:bce_app/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main/main_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(),
      home: MainViewPage(),
    );
  }
}
