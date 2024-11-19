// main.dart
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/controllers/home_controller.dart';
import 'package:presentation/screens/home_screen.dart';

void main() {
  DI di = DI();
  di.init();
  Get.put(HomeController(
    getBanners: di.getBanners,
    getCategories: di.getCategories,
    getMedicalCenters: di.getMedicalCenters,
    getDoctors: di.getDoctors,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      home: HomeScreen(),
    );
  }
}
