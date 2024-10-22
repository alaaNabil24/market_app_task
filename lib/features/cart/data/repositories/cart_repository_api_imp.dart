import 'package:dartz/dartz.dart';

import '../../../products/domain/entities/product_data.dart';
import '../../domain/repositories/cart_repository_api.dart';

class CartRepositoryApiImp implements CartRepositoryApi {


  @override
  Future<Either<String, String>> deleteProductFromCart(id) {
    // TODO: implement deleteProductFromCart
    throw UnimplementedError();
  }

  @override
  Future<Either<String, List<Product>>> getCartData() {
    // TODO: implement getCartData
    throw UnimplementedError();
  }
}

