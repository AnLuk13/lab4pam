class DoctorModel {
  final String image;
  final String fullName;
  final String typeOfDoctor;
  final String locationOfCenter;
  final double reviewRate;
  final int reviewsCount;

  DoctorModel({
    required this.image,
    required this.fullName,
    required this.typeOfDoctor,
    required this.locationOfCenter,
    required this.reviewRate,
    required this.reviewsCount,
  });

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