import 'package:dartz/dartz.dart';

import '../entities/product_data.dart';

abstract class ProductsRepositoryApi {
  Future<Either<String, List<Product>>> getProducts();
  Future<Either<String, String>> addProductToCart(id);
}
