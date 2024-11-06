import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/banner_model.dart';
import '../models/category_model.dart';
import '../models/medical_center_model.dart';
import '../models/doctor_model.dart';

class LocalDataSource {
  Future<List<BannerModel>> fetchBanners() async {
    final String response = await rootBundle.loadString('assets/v1.json');
    final data = json.decode(response);
    return (data['banners'] as List).map((e) => BannerModel.fromJson(e)).toList();
  }

  Future<List<CategoryModel>> fetchCategories() async {
    final String response = await rootBundle.loadString('assets/v1.json');
    final data = json.decode(response);
    return (data['categories'] as List).map((e) => CategoryModel.fromJson(e)).toList();
  }

  Future<List<MedicalCenterModel>> fetchNearbyMedicalCenters() async {
    final String response = await rootBundle.loadString('assets/v1.json');
    final data = json.decode(response);
    return (data['nearby_centers'] as List)
        .map((e) => MedicalCenterModel.fromJson(e))
        .toList();
  }

  Future<List<DoctorModel>> fetchDoctors() async {
    final String response = await rootBundle.loadString('assets/v1.json');
    final data = json.decode(response);
    return (data['doctors'] as List).map((e) => DoctorModel.fromJson(e)).toList();
  }
}