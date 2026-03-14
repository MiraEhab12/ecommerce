

import 'package:ecommerce_udemy/core/data/local/cache_helper.dart';
import 'package:ecommerce_udemy/utils/cache_utils/pref_keys.dart';

class CacheVars {
  static int? get kidId => CacheHelper.getData(key: PrefKeys.kidID);
  static dynamic get userId => CacheHelper.getData(key: PrefKeys.userId);
  static String? get kidName => CacheHelper.getData(key: PrefKeys.kidName);
  static String? get kidStory => CacheHelper.getData(key: PrefKeys.kidStory);
  static String? get kidGender => CacheHelper.getData(key: PrefKeys.kidGender);
  static String? get kidBirthdate =>
      CacheHelper.getData(key: PrefKeys.kidBirthdate);
}
