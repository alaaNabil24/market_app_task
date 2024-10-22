import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:market_app_task/features/products/domain/entities/product_data.dart';

import '../../domain/repositories/products_repository_api.dart';
import '../datasources/remote/products_api_service.dart';
import '../models/products_model.dart';

class ProductsRepositoryApiImpl implements ProductsRepositoryApi {
  ProductsApiService productsApiService = ProductsApiService();

  ProductsModel productsModel = ProductsModel();
  @override
  Future<Either<String, List<Product>>> getProducts() async {
    try {
      Response res = await productsApiService.getProducts();

      if (res.statusCode == 200) {
        List<dynamic> productsModel =
            res.data.map((json) => ProductsModel.fromJson(json)).toList();

        List<Product> productsList = productsModel
            .map((e) => Product(
                  id: e.id ?? 0,
                  title: e.title ?? "",
                  price: e.price ?? 0.0,
                  description: e.description ?? "",
                  image: e.image ?? "",
                  rating: e.rating?.rate ?? 0.0,
                ))
            .toList();
        return Future.value(Right(productsList));
      } else {
        return Future.value(const Left("Something went wrong"));
      }
    } on DioException catch (e) {
      return Future.value(Left(e.message.toString()));
    }
  }

  @override
  Future<Either<String, String>> addProductToCart(id) async {
    try {
      Response res = await productsApiService.addProductToCart(productId: id);

      if (res.statusCode == 200) {
        return Future.value(const Right("Success added to cart"));
      } else {
        return Future.value(const Left("Failed added to cart"));
      }
    } on DioException catch (e) {
      return Future.value(Left(e.message.toString()));
    }
  }
}
