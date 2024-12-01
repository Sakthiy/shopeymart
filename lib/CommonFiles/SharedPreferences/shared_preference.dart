import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtils {
  // Nullable SharedPreferences instance.
  static SharedPreferences? _prefsInstance;

  // Getter for SharedPreferences instance.
  static Future<SharedPreferences> get _instance async {
    _prefsInstance ??= await SharedPreferences.getInstance();
    return _prefsInstance!;
  }

  // Call this method in `initState` of your app's main widget.
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  // Get a String value from preferences.
  static String? getString(String key) {
    if (_prefsInstance == null) {
      throw Exception("SharedPreferences not initialized. Please call init() first.");
    }
    return _prefsInstance?.getString(key); // Default to empty string if not found
  }

  // Set a String value in preferences.
  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key, value);
  }

  // Get a bool value from preferences.
  static bool? getBool(String key) {
    if (_prefsInstance == null) {
      throw Exception("SharedPreferences not initialized. Please call init() first.");
    }
    return _prefsInstance?.getBool(key); // Default to false if not found
  }

  // Set a bool value in preferences.
  static Future<bool> setBool(String key, bool value) async {
    var prefs = await _instance;
    return prefs.setBool(key, value);
  }

  // Get an int value from preferences.
  static int? getInt(String key) {
    if (_prefsInstance == null) {
      throw Exception("SharedPreferences not initialized. Please call init() first.");
    }
    return _prefsInstance?.getInt(key); // Default to 0 if not found
  }

  // Set an int value in preferences.
  static Future<bool> setInt(String key, int value) async {
    var prefs = await _instance;
    return prefs.setInt(key, value);
  }

  // Get a double value from preferences.
  static double? getDouble(String key) {
    if (_prefsInstance == null) {
      throw Exception("SharedPreferences not initialized. Please call init() first.");
    }
    return _prefsInstance?.getDouble(key); // Default to 0.0 if not found
  }

  // Set a double value in preferences.
  static Future<bool> setDouble(String key, double value) async {
    var prefs = await _instance;
    return prefs.setDouble(key, value);
  }

  // Get a List<String> value from preferences.
  static List<String>? getStringList(String key) {
    if (_prefsInstance == null) {
      throw Exception("SharedPreferences not initialized. Please call init() first.");
    }
    return _prefsInstance?.getStringList(key); // Default to empty list if not found
  }

  // Set a List<String> value in preferences.
  static Future<bool> setStringList(String key, List<String> value) async {
    var prefs = await _instance;
    return prefs.setStringList(key, value);
  }
}
