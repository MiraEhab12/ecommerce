
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_udemy/features/auth_screen/data/repo/auth_repo.dart';
import 'package:ecommerce_udemy/features/home_screen/data/repo/category_repo.dart';
import 'package:ecommerce_udemy/features/home_screen/data/repo/home_repo.dart';
import 'package:ecommerce_udemy/utils/helpers/storage_helper.dart';
import 'package:http/http.dart' show Client;
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:ecommerce_udemy/core/data/remote/dio_helper.dart';
import 'package:ecommerce_udemy/utils/api_utils/api_constant.dart';
import 'package:ecommerce_udemy/utils/helpers/shared_prefrence.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'core/data/remote/interceptors/auth_interceptor.dart';


final sl = GetIt.instance;

class DbInjection {
  static Future<void> init() async {
    ///Services
    await _initSharedPref();
    _serviceInit();
    _apiClientInit();
    _connectivityInit();
    _storageHelperInit();

    ///Repositories
    _loginRepoInit();
    _homeRepoInit();
    _categoryRepoInit();
 
  }

  static Future<void> _initSharedPref() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerSingleton<SharedPreferencesService>(
      SharedPreferencesService(sharedPreferences: sharedPreferences),
    );
  }

  static void _serviceInit() {
    sl.registerLazySingleton<Client>(() => Client());
  }
//storage helper
static void _storageHelperInit() {
    sl.registerLazySingleton(() => SecureStorage());
  }
  static void _connectivityInit() {
    sl.registerLazySingleton(() => Connectivity());
  }

  static void _apiClientInit() {
    sl.registerSingleton<Dio>(
      Dio(
          BaseOptions(
            baseUrl: ApiConstant.baseUrl,
            receiveDataWhenStatusError: true,

            connectTimeout: const Duration(milliseconds: 60 * 1000),
            sendTimeout: const Duration(milliseconds: 60 * 1000),
            receiveTimeout: const Duration(milliseconds: 60 * 1000),
          ),
        )
        ..interceptors.addAll([
          AuthInterceptor(),
          LogInterceptor(
            request: false,
            responseHeader: false,
            error: false,
            requestBody: true,
            responseBody: true,
          ),
        ]),
    );

    sl.registerSingleton<Logger>(Logger());

    
   

    sl.registerSingleton<DioHelper>(DioHelper(dio: sl(), logger: sl()));
  }

  
  static void _loginRepoInit() {
    sl.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(sl()),
    );
  }
   static void _homeRepoInit() {
    sl.registerLazySingleton<ProductRepo>(
      () => ProductRepoImpl(sl()),
    );
  } 
   static void _categoryRepoInit() {
    sl.registerLazySingleton<CategoryRepo>(
      () => CategoryRepoImpl(sl()),
    );
  } 
 

}