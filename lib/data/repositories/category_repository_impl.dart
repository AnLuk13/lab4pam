import '../../domain/entities/category_entity.dart';
import '../../domain/repositories/category_repository.dart';
import '../datasources/local_data_sources.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final LocalDataSource dataSource;

  CategoryRepositoryImpl(this.dataSource);

  @override
  Future<List<Category>> fetchCategories() async {
    return await dataSource.fetchCategories();
  }
}