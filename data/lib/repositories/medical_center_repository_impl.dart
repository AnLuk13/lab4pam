import 'package:data/mappers/medical_center_mapper.dart';
import 'package:domain/entities/medical_center_entity.dart';
import 'package:domain/repositories/medical_center_repository.dart';
import '../datasources/local_data_sources.dart';

class MedicalCenterRepositoryImpl implements MedicalCenterRepository {
  final LocalDataSource dataSource;

  MedicalCenterRepositoryImpl(this.dataSource);

  @override
  Future<List<MedicalCenter>> fetchNearbyMedicalCenters() async {
    var response = await dataSource.fetchNearbyMedicalCenters();
    return response.map((e) => MedicalCenterMapper().mapModelToEntity(e)).toList();
  }
}