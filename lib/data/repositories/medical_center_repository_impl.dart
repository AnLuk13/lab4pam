import '../../domain/entities/medical_center_entity.dart';
import '../../domain/repositories/medical_center_repository.dart';
import '../datasources/local_data_sources.dart';

class MedicalCenterRepositoryImpl implements MedicalCenterRepository {
  final LocalDataSource dataSource;

  MedicalCenterRepositoryImpl(this.dataSource);

  @override
  Future<List<MedicalCenter>> fetchNearbyMedicalCenters() async {
    return await dataSource.fetchNearbyMedicalCenters();
  }
}