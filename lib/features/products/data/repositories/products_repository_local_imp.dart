import 'package:hive/hive.dart';
import 'package:market_app_task/features/products/domain/entities/product_data.dart';
import 'package:market_app_task/features/products/domain/repositories/products_repository_local.dart';

import 'dart:convert';

class ProductsRepositoryLocalImpl implements ProductsRepositoryLocal {
  @override
  Future<List<Product>> getProducts() async {
    final dbBox = await Hive.openBox("market");
    final cachedProducts = dbBox.get("products");

    return cachedProducts;
  }

  @override
  Future<void> cacheProducts(List<Product> products) async {
    final dbBox = await Hive.openBox("market");
    return dbBox.put("products", products);
  }
}
