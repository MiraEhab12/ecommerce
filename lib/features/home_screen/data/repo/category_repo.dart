import 'package:dartz/dartz.dart';
import 'package:ecommerce_udemy/core/data/exceptions/exceptions.dart';
import 'package:ecommerce_udemy/core/data/remote/dio_helper.dart';
import 'package:ecommerce_udemy/utils/api_utils/api_constant.dart';

abstract class CategoryRepo {
  Future<Either<AppException, List<String>>> getCategories();
}

class CategoryRepoImpl implements CategoryRepo {
  final DioHelper _apiClient;

  CategoryRepoImpl(this._apiClient);

  @override
  Future<Either<AppException, List<String>>> getCategories() async {
    try {
      final response = await _apiClient.get(endPoint: ApiConstant.categories);

      // 🔴 هنا بدل ما نعمل response.data
      final data = response; // response نفسه List

      if (data is! List) {
        return left(AppException('Unexpected response format'));
      }

      return right(List<String>.from(data));
    } on AppException catch (e) {
      return left(e);
    } catch (e) {
      return left(AppException(e.toString()));
    }
  }
}
