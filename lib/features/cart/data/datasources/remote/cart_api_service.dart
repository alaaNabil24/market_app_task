import 'package:dio/dio.dart';

import '../../../../../core/helpers/dio_helper.dart';

class CartApiService {
  Future<Response> getCartData() async {
    return await DioHelper.getData(url: 'carts/user/5');
  }

  Future<Response> deleteProductFromCart({required int productId}) async {
    return await DioHelper.deleteData(url: 'carts/$productId');
  }
}
