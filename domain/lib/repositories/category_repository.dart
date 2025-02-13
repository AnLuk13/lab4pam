import '../entities/category_entity.dart';

abstract class CategoryRepository {
  Future<List<Category>> fetchCategories();
}