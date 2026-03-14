import 'package:dartz/dartz.dart';
import 'package:ecommerce_udemy/core/data/exceptions/exceptions.dart';
import 'package:ecommerce_udemy/core/data/remote/dio_helper.dart';
import 'package:ecommerce_udemy/features/home_screen/data/model/home_model.dart';
import 'package:ecommerce_udemy/utils/api_utils/api_constant.dart';

abstract class ProductRepo {
  Future<Either<List<ProductModel>, AppException>> getProducts();
  Future<Either<List<ProductModel>, AppException>> getProductsByCategory(String category);
}

class ProductRepoImpl implements ProductRepo {
  final DioHelper _apiClient;
  ProductRepoImpl(this._apiClient);

  @override
  Future<Either<List<ProductModel>, AppException>> getProducts() async {
    try {
      final response = await _apiClient.get(
        endPoint: ApiConstant.products,
      );

      final List products = response.data['products'];

      final productsList =
          products.map((e) => ProductModel.fromMap(e)).toList();

      return left(productsList);
    } on AppException catch (e) {
      return right(e);
    }
  }
  

  Future<Either<List<ProductModel>, AppException>> getProductsByCategory(String category) async {
    try {
      final response = await _apiClient.get(
        endPoint: "${ApiConstant.productCategory}$category",
      );

      final List products = response.data['products'];

      final productsList =
          products.map((e) => ProductModel.fromMap(e)).toList();

      return left(productsList);
    } on AppException catch (e) {
      return right(e);
    }
  }
}
