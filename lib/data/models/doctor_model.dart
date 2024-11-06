import '../../domain/entities/doctor_entity.dart';

class DoctorModel extends Doctor {
  DoctorModel({
    required String image,
    required String fullName,
    required String typeOfDoctor,
    required String locationOfCenter,
    required double reviewRate,
    required int reviewsCount,
  }) : super(
    image: image,
    fullName: fullName,
    typeOfDoctor: typeOfDoctor,
    locationOfCenter: locationOfCenter,
    reviewRate: reviewRate,
    reviewsCount: reviewsCount,
  );

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      image: json['image'],
      fullName: json['full_name'],
      typeOfDoctor: json['type_of_doctor'],
      locationOfCenter: json['location_of_center'],
      reviewRate: json['review_rate'],
      reviewsCount: json['reviews_count'],
    );
  }
}