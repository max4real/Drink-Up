import 'package:drink_up/modules/home_page/v_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: false,
    ),
    home: HomePage_(),
  ));
}
