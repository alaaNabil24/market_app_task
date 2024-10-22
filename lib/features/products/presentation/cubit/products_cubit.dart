import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/product_data.dart';
import '../../domain/usecases/products_use_case.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._useCase) : super(ProductsInitial());

  final ProductsUseCase _useCase;


  List<Product> products = [];
  Future<void> getProducts() async {
    emit(ProductsLoading());

    bool hasInternet = await InternetConnection().hasInternetAccess;

    if (hasInternet) {
      final result = await _useCase.getProductsFromApi();
      products = result.getOrElse(() => []);
      result.fold(
        (l) => emit(ProductsError(message: l)),
        (r) => emit(ProductsLoaded()),
      );
      if (result.isRight()) {
        await _useCase.cacheProducts(products: result.getOrElse(() => []));
      }
    } else {
      final localProducts = await _useCase.getProductsFromLocal();
      products = localProducts;
      emit(ProductsLoaded());
    }
  }

  Future<void> addProductToCart({required int id}) async {
    emit(AddToCartLoading());
    bool hasInternet = await InternetConnection().hasInternetAccess;
    if (hasInternet) {

      final result = await _useCase.addProductToCart(id: id);

      result.fold((l) => emit(AddToCartError(message: l)),
          (r) => emit(AddToCartSuccess(message: r)));
    } else {
      emit(AddToCartError(message: "No internet connection"));
    }
  }
}
