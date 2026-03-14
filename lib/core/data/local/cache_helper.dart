import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }  



  static dynamic getData({required String key}) {
    return sharedPreferences!.get(key);
  }

  static Future saveData({required String key, required dynamic value}) async {
    if (value is String) {
      return await sharedPreferences!.setString(key, value);
    }
    if (value is int) {
      return await sharedPreferences!.setInt(key, value);
    }
    if (value is bool) {
      return await sharedPreferences!.setBool(key, value);
    }

    return await sharedPreferences!.setDouble(key, value);
  }  


  




  static Future<bool> removeData(String key) async {
    return await sharedPreferences!.remove(key);
  }
  static Future<bool> containsKey({required String key}) async {
    return sharedPreferences!.containsKey(key);
  }
  static Future<bool> clearData({required int key}) async {
    return sharedPreferences!.clear();
  }
  static Future<bool> clearDataString({required String key}) async {
    return sharedPreferences!.clear();
  }
  static Future<dynamic> put({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences!.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences!.setBool(key, value);
    } else {
      return await sharedPreferences!.setInt(key, value);
    }
  }
}
