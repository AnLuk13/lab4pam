import '../entities/medical_center_entity.dart';

abstract class MedicalCenterRepository {
  Future<List<MedicalCenter>> fetchNearbyMedicalCenters();
}