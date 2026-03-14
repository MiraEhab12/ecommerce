import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce_udemy/core/data/local/cache_helper.dart';
import 'package:logger/logger.dart';

import '../exceptions/exceptions.dart';
import '../model/response_model.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class DioHelper {
  final Dio _dio;
  final Logger _logger;

  DioHelper({required Dio dio, required Logger logger})
    : _dio = dio,
      _logger = logger;

  void setHeaders({bool isFormData = false}) async {
    try {
      final langCode = LocalizeAndTranslate.getLanguageCode();
      _dio.options.headers = {
        'Authorization': "Bearer ${CacheHelper.getData(key: "token")}",
        'Content-Type': isFormData ? 'multipart/form-data' : 'application/json',
        'Accept': 'application/json',
        'Accept-Language': langCode,
      };
    } catch (e) {
      final langCode = LocalizeAndTranslate.getLanguageCode();

      _dio.options.headers = {
        'Authorization': "Bearer ${CacheHelper.getData(key: "token")}",
        'Content-Type': isFormData ? 'multipart/form-data' : 'application/json',
        'Accept': 'application/json',
        'Accept-Language': langCode,
      };
    }
  }

  /// GET request
  /*Future<ResponseModel> get({
    required String endPoint,
    Map<String, dynamic>? query,
    Map<String, dynamic> data = const {},

    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      setHeaders(isFormData: false);
      final response = await _dio.get(
        endPoint,
        queryParameters: query,
        onReceiveProgress: onReceiveProgress,
      );
      return ResponseModel.fromJson(response.data);
    } on DioException catch (error) {
      _logger.e("GET request failed: $error");
      throw handleDioExceptions(error);
    } on SocketException {
      throw AppException('No Internet connection');
    } on FormatException catch (e) {
      throw AppException("Invalid format: ${e.message}");
    } catch (e) {
      throw AppException("Unexpected error: ${e.toString()}");
    }
  }
*/

  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    try {
      setHeaders(isFormData: false);

      final response = await _dio.get(endPoint, queryParameters: query);

      final data = response.data;

      // ✅ لو Map رجّع ResponseModel
      if (data is Map<String, dynamic>) {
        return ResponseModel.fromJson(data);
      }

      // ✅ لو List رجّعها زي ما هي
      if (data is List) {
        return data;
      }

      // ❌ أي حاجة غير كده
      throw AppException('Unexpected response type');
    } on DioException catch (error) {
      throw handleDioExceptions(error);
    } on SocketException {
      throw AppException('No Internet connection');
    } catch (e) {
      throw AppException(e.toString());
    }
  }

  /// POST request
  Future<ResponseModel> post({
    required String endPoint,

    Map<String, dynamic> data = const {},
    bool isFormData = false,
    Map<String, dynamic>? query,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      setHeaders(isFormData: isFormData);
      final response = await _dio.post(
        endPoint,
        options: Options(),

        data: isFormData ? FormData.fromMap(data) : jsonEncode(data),
        queryParameters: query,
        onSendProgress: onSendProgress,
      );

      return ResponseModel.fromJson(response.data);
    } on DioException catch (error) {
      _logger.e("POST request failed: $error");
      throw handleDioExceptions(error);
    } on SocketException {
      throw AppException('No Internet connection');
    } on FormatException catch (e) {
      throw AppException("Invalid format: ${e.message}");
    } catch (e) {
      throw AppException("Unexpected error: ${e.toString()}");
    }
  }

  Future<ResponseModel> delete({
    required String endPoint,

    Map<String, dynamic> data = const {},
    bool isFormData = false,
    Map<String, dynamic>? query,
  }) async {
    try {
      setHeaders(isFormData: isFormData);

      final response = await _dio.delete(
        endPoint,
        data: isFormData ? FormData.fromMap(data) : jsonEncode(data),
        queryParameters: query,
      );

      return ResponseModel.fromJson(response.data);
    } on DioException catch (error) {
      _logger.e("POST request failed: $error");
      throw handleDioExceptions(error);
    } on SocketException {
      throw AppException('No Internet connection');
    } on FormatException catch (e) {
      throw AppException("Invalid format: ${e.message}");
    } catch (e) {
      throw AppException("Unexpected error: ${e.toString()}");
    }
  }
}
