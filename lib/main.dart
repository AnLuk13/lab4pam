// main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data/datasources/local_data_sources.dart';
import 'data/repositories/banner_repository_impl.dart';
import 'data/repositories/category_repository_impl.dart';
import 'data/repositories/medical_center_repository_impl.dart';
import 'data/repositories/doctor_repository_impl.dart';
import 'domain/usecases/get_banners_usecase.dart';
import 'domain/usecases/get_categories_usecase.dart';
import 'domain/usecases/get_medical_centers_usecase.dart';
import 'domain/usecases/get_doctors_usecase.dart';
import 'presentation/controllers/home_controller.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  final dataSource = LocalDataSource();
  Get.put(HomeController(
    getBanners: GetBanners(BannerRepositoryImpl(dataSource)),
    getCategories: GetCategories(CategoryRepositoryImpl(dataSource)),
    getMedicalCenters: GetMedicalCenters(MedicalCenterRepositoryImpl(dataSource)),
    getDoctors: GetDoctors(DoctorRepositoryImpl(dataSource)),
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
