import '../entities/category_entity.dart';
import '../repositories/category_repository.dart';

class GetCategories {
  final CategoryRepository repository;

  GetCategories(this.repository);

  Future<List<Category>> call() async {
    return await repository.fetchCategories();
  }
}