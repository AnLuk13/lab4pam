import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/banner_model.dart';
import '../models/category_model.dart';
import '../models/medical_center_model.dart';
import '../models/doctor_model.dart';

class LocalDataSource {
  // Cache the loaded JSON to avoid multiple asset loading
  Map<String, dynamic>? _cachedData;

  // Method to initialize and load the data
  Future<void> init() async {
    if (_cachedData == null) {
      final String response = await rootBundle.loadString('assets/v1.json');
      _cachedData = json.decode(response);
    }
  }

  Future<List<BannerModel>> fetchBanners() async {
    await init(); // Ensure the data is loaded
    return (_cachedData!['banners'] as List)
        .map((e) => BannerModel.fromJson(e))
        .toList();
  }

  Future<List<CategoryModel>> fetchCategories() async {
    await init(); // Ensure the data is loaded
    return (_cachedData!['categories'] as List)
        .map((e) => CategoryModel.fromJson(e))
        .toList();
  }

  Future<List<MedicalCenterModel>> fetchNearbyMedicalCenters() async {
    await init(); // Ensure the data is loaded
    return (_cachedData!['nearby_centers'] as List)
        .map((e) => MedicalCenterModel.fromJson(e))
        .toList();
  }

  Future<List<DoctorModel>> fetchDoctors() async {
    await init(); // Ensure the data is loaded
    return (_cachedData!['doctors'] as List)
        .map((e) => DoctorModel.fromJson(e))
        .toList();
  }
}
