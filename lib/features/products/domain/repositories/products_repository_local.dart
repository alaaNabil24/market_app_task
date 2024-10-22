import '../entities/product_data.dart';

abstract class ProductsRepositoryLocal {
  Future<List<Product>> getProducts();
  // save data in local DB
  Future<void> cacheProducts(List<Product> products);
}
