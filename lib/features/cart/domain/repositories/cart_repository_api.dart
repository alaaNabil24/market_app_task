import 'package:dartz/dartz.dart';

import '../../../products/domain/entities/product_data.dart';



abstract class CartRepositoryApi {
  Future<Either<String, List<Product>>> getCartData();
  Future<Either<String, String>> deleteProductFromCart(id);
}
