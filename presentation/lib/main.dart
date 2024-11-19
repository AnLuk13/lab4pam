// import 'package:di/di.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'controllers/home_controller.dart';
// import 'screens/home_screen.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   // Initialize dependency injection
//   final di = DI();
//   await di.init(); // Ensure init supports async if needed (e.g., loading assets)
//
//   // Register HomeController with GetX
//   Get.put(HomeController(
//     getBanners: di.getBanners,
//     getCategories: di.getCategories,
//     getMedicalCenters: di.getMedicalCenters,
//     getDoctors: di.getDoctors,
//   ));
//
//   runApp(MyApp()); // Pass DI is not required if it is used only in main
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       theme: ThemeData(
//         fontFamily: 'Roboto',
//       ),
//       home: HomeScreen(), // HomeScreen doesn't need DI directly
//     );
//   }
// }
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/home_controller.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      home: InitializationScreen(), // Start with the initialization screen
    );
  }
}

class InitializationScreen extends StatelessWidget {
  final DI di = DI();

  Future<void> _initializeDependencies() async {
    await di.init(); // Initialize the DI
    Get.put(HomeController(
      getBanners: di.getBanners,
      getCategories: di.getCategories,
      getMedicalCenters: di.getMedicalCenters,
      getDoctors: di.getDoctors,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeDependencies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading spinner while dependencies are being initialized
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          // Handle any initialization errors
          return Scaffold(
            body: Center(
              child: Text('Failed to initialize: ${snapshot.error}'),
            ),
          );
        } else {
          // Once initialization is complete, show the main screen
          return HomeScreen();
        }
      },
    );
  }
}
