library fake_store_api;

export 'src/models/models.dart';

import 'package:dartz/dartz.dart';

import 'src/models/models.dart';
import 'src/repositories/product_repository_impl.dart';
import 'src/services/product_service.dart';

class FakeStoreApi {
  static final repository = ProductRepositoryImpl(ProductService());

  Future<Either<String, List<ProductModel>>> getProducts() {
    return repository.getProducts();
  }

  Future<Either<String, List<CategoryModel>>> getCategories() async {
    return await repository.getCategories();
  }

  Future<Either<String, ProductModel>> getProductById(int id) async {
    return await repository.getProductById(id);
  }
}
