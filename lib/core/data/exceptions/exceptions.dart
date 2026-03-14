import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class AppException implements Exception {
  final String? message;

  AppException(this.message);

  @override
  String toString() => message ?? "";
}

class NetworkException extends AppException {
  NetworkException(super.message);
}

class ServerException extends AppException {
  final int? statusCode;
  final dynamic errors;
  ServerException(super.message, this.statusCode, this.errors);
}

final logger = Logger();

AppException handleDioExceptions(DioException error) {
  logger.e("Error IS: $error");
  logger.e("Type IS: ${error.type}");
  logger.e("Response IS: ${error.response}");

  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      throw NetworkException("Connection timed out");
    case DioExceptionType.sendTimeout:
      throw NetworkException("Send request timed out");
    case DioExceptionType.receiveTimeout:
      throw NetworkException("Receive request timed out");
    case DioExceptionType.badResponse:
      if (error.response?.data is Map) {
        throw ServerException(
          error.response?.data is Map
              ? error.response?.data['message']
              : 'error occurred, please try again',
          error.response?.statusCode,
          error.response?.data is Map
              ? error.response?.data['errors']
              : 'error occurred, please try again',
        );
      } else {
        throw ServerException("Server error", error.response?.statusCode, null);
      }
    case DioExceptionType.cancel:
      throw AppException("Request was cancelled");
    case DioExceptionType.unknown:
      throw AppException("An unknown error occurred: ${error.message}");
    case DioExceptionType.badCertificate:
      throw AppException("Bad certificate error");
    case DioExceptionType.connectionError:
      throw NetworkException("Connection error occurred");
  }
}