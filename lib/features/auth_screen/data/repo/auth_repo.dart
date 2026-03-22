import 'package:dartz/dartz.dart';
import 'package:ecommerce_udemy/core/data/exceptions/exceptions.dart';
import 'package:ecommerce_udemy/core/data/remote/dio_helper.dart';
import 'package:ecommerce_udemy/features/auth_screen/data/model/auth_model.dart';
import 'package:ecommerce_udemy/utils/api_utils/api_constant.dart';

abstract class AuthRepo {
  Future<Either<AuthModel, AppException>> login(
    String username,
    String password,
  );
}

class AuthRepoImpl implements AuthRepo {
  final DioHelper _apiClient;
  AuthRepoImpl(this._apiClient);
  @override
  Future<Either<AuthModel, AppException>> login(
    String username,
    String password,
  ) async {
    try {
      print("Login payload: { email: $username, password: $password }");
      final response = await _apiClient.post(
        endPoint: ApiConstant.login,

        data: {"username": username, "password": password},
      );

      final data = response.data;

      final authModel = AuthModel.fromMap(data);
      return left(authModel);
    } on AppException catch (e) {
      print("Status: ${e.message}");

      return right(e);
    }
  }
}
