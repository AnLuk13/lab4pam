// presentation/controllers/home_controller.dart
import 'package:domain/entities/banner_entity.dart';
import 'package:domain/entities/category_entity.dart';
import 'package:domain/entities/doctor_entity.dart';
import 'package:domain/entities/medical_center_entity.dart';
import 'package:domain/usecases/get_banners_usecase.dart';
import 'package:domain/usecases/get_categories_usecase.dart';
import 'package:domain/usecases/get_doctors_usecase.dart';
import 'package:domain/usecases/get_medical_centers_usecase.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final GetBanners getBanners;
  final GetCategories getCategories;
  final GetMedicalCenters getMedicalCenters;
  final GetDoctors getDoctors;

  HomeController({
    required this.getBanners,
    required this.getCategories,
    required this.getMedicalCenters,
    required this.getDoctors,
  });

  var banners = <BannerEntity>[].obs;
  var categories = <Category>[].obs;
  var nearbyCenters = <MedicalCenter>[].obs;
  var doctors = <Doctor>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    banners.value = await getBanners();
    categories.value = await getCategories();
    nearbyCenters.value = await getMedicalCenters();
    doctors.value = await getDoctors();
  }

  void reverseDoctorsList() {
    doctors.value = doctors.reversed.toList();
  }
}
