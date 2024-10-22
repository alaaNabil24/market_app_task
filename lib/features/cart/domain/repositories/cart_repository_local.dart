import '../entities/product_data.dart';

abstract class CartRepositoryLocal {
  Future<List<Product>> getCartData();
  // save data in local DB
  Future<void> cacheCart(List<Product> products);
}
