import 'package:dartz/dartz.dart';
import 'package:ecommerce_udemy/core/data/exceptions/exceptions.dart';
import 'package:ecommerce_udemy/core/data/remote/dio_helper.dart';
import 'package:ecommerce_udemy/features/cartscreen/data/model/cart_model.dart';
import 'package:ecommerce_udemy/utils/api_utils/api_constant.dart';

abstract class CartRepo {
  Future<Either<List<CartModel>, AppException>> getUserCart(int userId);
  Future<Either<List<CartModel>, AppException>> addCart(
    int productId,
    int quantity,
    int userId,
  );
}

class CartRepoImpl implements CartRepo {
  final DioHelper _apiClient;
  CartRepoImpl(this._apiClient);
  @override
  Future<Either<List<CartModel>, AppException>> getUserCart(int userId) async {
    try {
      final response = await _apiClient.get(
        endPoint: "${ApiConstant.userCarts}$userId",
      );

      final data = response.data['carts'];

      // لو carts مش List, خليها فاضي
      final List cartsData = data is List ? data : [];

      final carts = cartsData.map((e) => CartModel.fromMap(e)).toList();

      return left(carts);
    } on AppException catch (e) {
      return right(e);
    }
  }

  Future<Either<List<CartModel>, AppException>> addCart(
    int productId,
    int quantity,
    int userId,
  ) async {
    try {
      final response = await _apiClient.post(
        endPoint: ApiConstant.addProductToCart,
        data: {
          "userId": userId,
          "products": [
            {"id": productId, "quantity": quantity},
          ],
        },
      );

      final data = response.data['carts'];

      // لو carts مش List, خليها فاضي
      final List cartsData = data is List ? data : [];

      final carts = cartsData.map((e) => CartModel.fromMap(e)).toList();

      return left(carts);
    } on AppException catch (e) {
      return right(e);
    }
  }
}
