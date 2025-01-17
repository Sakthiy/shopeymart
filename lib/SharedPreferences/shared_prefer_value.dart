import 'package:shopeymart/SharedPreferences/shared_preference.dart';

class SharedPrefString{
  static String userToken = 'user token';
}

class SharedPreferValue {
  ///---------------------------------------------------------------------------
  static String? getToken = SharedPreferenceUtils.getString(SharedPrefString.userToken);
  static Future<bool> setToken({required String userToken}) =>
      SharedPreferenceUtils.setString(SharedPrefString.userToken, userToken);

  static Future<bool> removeUserToken =
      SharedPreferenceUtils.removeKey(SharedPrefString.userToken);
  static Future<bool> clearAllKeys =
      SharedPreferenceUtils.clearAll();

  ///---------------------------------------------------------------------------
  //Dark Theme
  static bool? getDarkMode = SharedPreferenceUtils.getBool('device theme');
  static Future<bool> darkModeSetTrue =
      SharedPreferenceUtils.setBool('device theme', true);
  static Future<bool> darkModeSetFalse =
      SharedPreferenceUtils.setBool('device theme', false);

  //System Theme
  static bool? getSystemThemeMode =
      SharedPreferenceUtils.getBool('system theme');
  static Future<bool> systemThemeSetTrue =
      SharedPreferenceUtils.setBool('system theme', true);
  static Future<bool> systemThemeSetFalse =
      SharedPreferenceUtils.setBool('system theme', false);
}
