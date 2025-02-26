import 'package:mangment_app/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CasheHelper {
  static late SharedPreferences sharedPreferences;
  static Future<void> casheInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var langData = getData(key: Constant.kLang);
    if (langData == null) {
      await setData(key: Constant.kLang, value: "en");
    }
    // if (getIsEnvelopeDone == null) {
    //   await setData(key: Constants.kIsEnvelopeDone, value: false);
    // }
    // begin initialized
    // if (spIsOrdered == null) {
    //   await setData(key: Constants.kIsOrdered, value: false);
    // }
  }

  static Future<bool> setData(
      {required String key, required dynamic value}) async {
    if (value is int) {
      await sharedPreferences.setInt(key, value);
      return true;
    } else if (value is String) {
      await sharedPreferences.setString(key, value);
      return true;
    } else if (value is bool) {
      await sharedPreferences.setBool(key, value);
      return true;
    } else if (value is double) {
      await sharedPreferences.setDouble(key, value);
      return true;
    }
    return false;
  }

  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  static Future<bool> deleteData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  static Future<void> clearCashe() async {
    await sharedPreferences.clear();
  }
}
