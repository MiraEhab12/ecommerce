import 'dart:convert' show jsonDecode, jsonEncode;

import 'package:shared_preferences/shared_preferences.dart';
import '../../core/data/exceptions/exceptions.dart';

class SharedPreferencesService {
  final SharedPreferences _sharedPreferences;

  SharedPreferencesService({required SharedPreferences sharedPreferences})
    : _sharedPreferences = sharedPreferences;

  dynamic getData({required String key}) {
    return _sharedPreferences.get(key);
  }

  Future<void> saveData({required String key, required dynamic value}) async {
    try {
      if (value is String) {
        await _sharedPreferences.setString(key, value);
      } else if (value is int) {
        await _sharedPreferences.setInt(key, value);
      } else if (value is bool) {
        await _sharedPreferences.setBool(key, value);
      } else if (value is double) {
        await _sharedPreferences.setDouble(key, value);
      } else {
        await _sharedPreferences.setString(key, value.toString());
      }
    } catch (e) {
      throw AppException("Error in saving data");
    }
  }

  Future<bool> removeData(String key) async {
    try {
      return await _sharedPreferences.remove(key);
    } catch (e) {
      throw AppException("Error in removing data");
    }
  }

  Future<bool> clearData() async {
    try {
      return await _sharedPreferences.clear();
    } catch (e) {
      throw AppException("Error in clearing data");
    }
  }

  String? get token => getData(key: 'token');
  String? get phoneNumber => getData(key: 'phoneNumber');
  bool get onboard => getData(key: 'onboard') ?? false;

  Future<void> setToken(String? token) async {
    await saveData(key: 'token', value: token as String);
  }

  Future<void> removeToken() async {
    await removeData('token');
  }

  Future<void> setOnboard() async {
    await saveData(key: 'onboard', value: true);
  }  Future<void> setUserPhoneNumber(String? phoneNumber) async {
    await saveData(key: 'phoneNumber', value: phoneNumber);
  }

  List<String> get deletedAccounts {
    final json = jsonDecode(getData(key: 'deletedAccounts') ?? "{}");
    if (json['deletedAccounts'] != null) {
      return json['deletedAccounts'].map<String>((e) => e.toString()).toList();
    }
    return [];
  }

  Future<void> addToDeleteAccounts(String userId) async {
    List<String> deletedAccounts = this.deletedAccounts;
    deletedAccounts.add(userId);
    return await saveData(
      key: 'deletedAccounts',
      value: jsonEncode({'deletedAccounts': deletedAccounts.toList()}),
    );
  }
}