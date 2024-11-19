import 'package:data/mappers/banner_mapper.dart';
import 'package:domain/entities/banner_entity.dart';
import 'package:domain/repositories/banner_repository.dart';

import '../datasources/local_data_sources.dart';

class BannerRepositoryImpl implements BannerRepository {
  final LocalDataSource dataSource;

  BannerRepositoryImpl(this.dataSource);

  @override
  Future<List<BannerEntity>> fetchBanners() async {
    var response = await dataSource.fetchBanners();
    return response.map((e) => BannerMapper().mapModelToEntity(e)).toList();
  }
}