


import 'package:ecommerce_udemy/core/data/local/cache_helper.dart';
import 'package:ecommerce_udemy/utils/cache_utils/pref_keys.dart';

class CacheSave {
  static saveKidId(id) async =>
      await CacheHelper.saveData(key: PrefKeys.kidID, value: id);


        
 

  static saveUserId(userId) async =>
      await CacheHelper.saveData(key: PrefKeys.userId, value: userId);
  static saveKidName(kidName) async =>
      await CacheHelper.saveData(key: PrefKeys.kidName, value: kidName);
  static saveKidStory(kidStory) async =>
      await CacheHelper.saveData(key: PrefKeys.kidStory, value: kidStory);
  static saveKidGender(kidGender) async =>
      await CacheHelper.saveData(key: PrefKeys.kidGender, value: kidGender);
  static saveKidBirthdate(kidBirthdate) async => await CacheHelper.saveData(
    key: PrefKeys.kidBirthdate,
    value: kidBirthdate,
  );
}
