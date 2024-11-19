//OLD LIST WITH OVERFLOW ISSUE
import 'package:domain/entities/doctor_entity.dart';
import 'package:flutter/material.dart';
import 'doctor_card.dart';

class DoctorListSection extends StatefulWidget {
  final List<Doctor> doctors;
  final VoidCallback onReverse;

  DoctorListSection({required this.doctors, required this.onReverse});

  @override
  _DoctorListSectionState createState() => _DoctorListSectionState();
}

class _DoctorListSectionState extends State<DoctorListSection> {
  // Map to store the favorite status of each doctor
  Map<String, bool> favoriteStatus = {};

  @override
  void initState() {
    super.initState();
    initializeFavoriteStatus();
  }

  // Initialize favorite status for all doctors
  void initializeFavoriteStatus() {
    for (var doctor in widget.doctors) {
      favoriteStatus[doctor.fullName] = favoriteStatus[doctor.fullName] ?? false;
    }
  }

  // Toggle favorite status for a specific doctor
  void toggleFavorite(String fullName) {
    setState(() {
      favoriteStatus[fullName] = !(favoriteStatus[fullName] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${widget.doctors.length} founds', // Display number of doctors
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            GestureDetector(
              onTap: widget.onReverse,
              child: const Text(
                'Default',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: widget.doctors.length,
            itemBuilder: (context, index) {
              final doctor = widget.doctors[index];
              return DoctorCard(
                name: doctor.fullName,
                specialty: doctor.typeOfDoctor,
                location: doctor.locationOfCenter,
                rating: doctor.reviewRate,
                reviews: doctor.reviewsCount,
                imagePath: doctor.image,
                isFavorite: favoriteStatus[doctor.fullName] ?? false,
                onFavoriteToggle: () => toggleFavorite(doctor.fullName),
              );
            },
          ),
        ),
      ],
    );
  }
}

//FIXED OVERFLOW
// import 'package:domain/entities/doctor_entity.dart';
// import 'package:flutter/material.dart';
// import 'doctor_card.dart';
//
// class DoctorListSection extends StatefulWidget {
//   final List<Doctor> doctors;
//   final VoidCallback onReverse;
//
//   DoctorListSection({required this.doctors, required this.onReverse});
//
//   @override
//   _DoctorListSectionState createState() => _DoctorListSectionState();
// }
//
// class _DoctorListSectionState extends State<DoctorListSection> {
//   // Map to store the favorite status of each doctor
//   Map<String, bool> favoriteStatus = {};
//   bool isReversed = false;
//
//   @override
//   void initState() {
//     super.initState();
//     initializeFavoriteStatus();
//   }
//
//   // Initialize favorite status for all doctors
//   void initializeFavoriteStatus() {
//     for (var doctor in widget.doctors) {
//       favoriteStatus[doctor.fullName] = favoriteStatus[doctor.fullName] ?? false;
//     }
//   }
//
//   // Toggle favorite status for a specific doctor
//   void toggleFavorite(String fullName) {
//     setState(() {
//       favoriteStatus[fullName] = !(favoriteStatus[fullName] ?? false);
//     });
//   }
//
//   void toggleReverseOrder() {
//     setState(() {
//       isReversed = !isReversed;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final displayedDoctors = isReversed ? widget.doctors.reversed.toList() : widget.doctors;
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               '${widget.doctors.length} founds', // Display number of doctors
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             GestureDetector(
//               onTap: toggleReverseOrder, // Update to use the local reverse toggle
//               child: const Text(
//                 'Default',
//                 style: TextStyle(color: Colors.blue),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 16),
//         // Wrap only the ListView in SingleChildScrollView
//         Expanded(
//           child: SingleChildScrollView(
//             child: ListView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: displayedDoctors.length,
//               itemBuilder: (context, index) {
//                 final doctor = displayedDoctors[index];
//                 return DoctorCard(
//                   name: doctor.fullName,
//                   specialty: doctor.typeOfDoctor,
//                   location: doctor.locationOfCenter,
//                   rating: doctor.reviewRate,
//                   reviews: doctor.reviewsCount,
//                   imagePath: doctor.image,
//                   isFavorite: favoriteStatus[doctor.fullName] ?? false,
//                   onFavoriteToggle: () => toggleFavorite(doctor.fullName),
//                 );
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
