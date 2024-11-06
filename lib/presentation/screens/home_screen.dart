// presentation/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../widgets/banner_slider.dart';
import '../widgets/categories_section.dart';
import '../widgets/medical_centers_section.dart';
import '../widgets/doctor_list_section.dart';
import '../widgets/search_bar.dart' as custom;
import '../widgets/app_bar.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      custom.SearchBar(),
                      SizedBox(height: 20),
                      Obx(() {
                        return controller.banners.isNotEmpty
                            ? BannerSlider(banners: controller.banners)
                            : CircularProgressIndicator();
                      }),
                      SizedBox(height: 20),
                      Obx(() {
                        return controller.categories.isNotEmpty
                            ? CategoriesSection(categories: controller.categories)
                            : CircularProgressIndicator();
                      }),
                      SizedBox(height: 20),
                      Obx(() {
                        return controller.nearbyCenters.isNotEmpty
                            ? MedicalCentersSection(centers: controller.nearbyCenters)
                            : CircularProgressIndicator();
                      }),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: LayoutBuilder(
            builder: (context, constraints) {
              return Obx(() {
                return controller.doctors.isNotEmpty
                    ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: constraints.maxHeight,
                    child: DoctorListSection(
                      doctors: controller.doctors,
                      onReverse: controller.reverseDoctorsList,
                    ),
                  ),
                )
                    : Center(child: CircularProgressIndicator());
              });
            },
          ),
        ),
      ),
    );
  }
}
