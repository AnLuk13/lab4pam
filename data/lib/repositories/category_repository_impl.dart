import 'package:data/mappers/category_mapper.dart';
import 'package:domain/entities/category_entity.dart';
import 'package:domain/repositories/category_repository.dart';

import '../datasources/local_data_sources.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final LocalDataSource dataSource;

  CategoryRepositoryImpl(this.dataSource);

  @override
  Future<List<Category>> fetchCategories() async {
    var response = await dataSource.fetchCategories();
    return response.map((e) => CategoryMapper().mapModelToEntity(e)).toList();
  }
}