import 'package:data/datasources/local_data_sources.dart';
import 'package:data/repositories/banner_repository_impl.dart';
import 'package:data/repositories/category_repository_impl.dart';
import 'package:data/repositories/doctor_repository_impl.dart';
import 'package:data/repositories/medical_center_repository_impl.dart';
import 'package:domain/usecases/get_banners_usecase.dart';
import 'package:domain/usecases/get_categories_usecase.dart';
import 'package:domain/usecases/get_doctors_usecase.dart';
import 'package:domain/usecases/get_medical_centers_usecase.dart';

class DI {
  final dataSource = LocalDataSource();
  late GetBanners getBanners;
  late GetCategories getCategories;
  late GetMedicalCenters getMedicalCenters;
  late GetDoctors getDoctors;
  void init() {
    getBanners = GetBanners(BannerRepositoryImpl(dataSource));
    getCategories = GetCategories(CategoryRepositoryImpl(dataSource));
    getMedicalCenters = GetMedicalCenters(MedicalCenterRepositoryImpl(dataSource));
    getDoctors = GetDoctors(DoctorRepositoryImpl(dataSource));
  }
}