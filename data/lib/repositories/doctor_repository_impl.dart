import 'package:data/mappers/doctor_mapper.dart';
import 'package:domain/entities/doctor_entity.dart';
import 'package:domain/repositories/doctor_repository.dart';
import '../datasources/local_data_sources.dart';

class DoctorRepositoryImpl implements DoctorRepository {
  final LocalDataSource dataSource;

  DoctorRepositoryImpl(this.dataSource);

  @override
  Future<List<Doctor>> fetchDoctors() async {
    var response = await dataSource.fetchDoctors();
    return response.map((e) => DoctorMapper().mapModelToEntity(e)).toList();

  }
}