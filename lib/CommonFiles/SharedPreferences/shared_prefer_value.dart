import 'package:shopeymart/CommonFiles/SharedPreferences/shared_preference.dart';

class SharedPreferValue{
  //Dark Theme
  static bool? getDarkMode = SharedPreferenceUtils.getBool('device theme');
  static Future<bool> darkModeSetTrue = SharedPreferenceUtils.setBool('device theme', true);
  static Future<bool> darkModeSetFalse = SharedPreferenceUtils.setBool('device theme', false);

  //System Theme
  static bool? getSystemThemeMode = SharedPreferenceUtils.getBool('system theme');
  static Future<bool> systemThemeSetTrue = SharedPreferenceUtils.setBool('system theme', true);
  static Future<bool> systemThemeSetFalse = SharedPreferenceUtils.setBool('system theme', false);
}
