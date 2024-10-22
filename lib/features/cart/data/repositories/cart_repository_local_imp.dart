import 'package:hive/hive.dart';
import 'package:market_app_task/features/cart/domain/repositories/cart_repository_local.dart';
import 'package:market_app_task/features/products/domain/entities/product_data.dart';
import 'package:market_app_task/features/products/domain/repositories/products_repository_local.dart';

import 'dart:convert';

class ProductsRepositoryLocalImpl implements CartRepositoryLocal {


  @override
  Future<void> cacheCart(List<Product> products) {
    // TODO: implement cacheCart
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getCartData() {
    // TODO: implement getCartData
    throw UnimplementedError();
  }
}
