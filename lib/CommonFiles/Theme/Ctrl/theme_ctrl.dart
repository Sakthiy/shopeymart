import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopeymart/CommonFiles/my_colors.dart';

class ThemeCtrl extends GetxController {
  // Rx variable to manage the current theme mode
  Rx<ThemeMode> themeMode = ThemeMode.light.obs;

  // // Function to update theme mode
  // void updateTheme(ThemeMode mode) {
  //   themeMode.value = mode;
  // }

  // Light theme definition
  ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: false,
      brightness: Brightness.light,
      textTheme: const TextTheme(
        bodySmall: TextStyle(fontFamily: 'Poppins-Medium'),
        bodyLarge: TextStyle(fontFamily: 'Poppins-Medium'),
        bodyMedium: TextStyle(fontFamily: 'Poppins-Medium'),
      ),
      primarySwatch: MyColors.myMaterialColor(
        MyColors.primaryColor,
      ), // You can use your custom color
      appBarTheme: AppBarTheme(
        color: MyColors.myMaterialColor(
          MyColors.primaryColor,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: MyColors.whiteColor,
      ),
    );
  }

  // Dark theme definition
  ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: false,
      brightness: Brightness.dark,
      primarySwatch: MyColors.myMaterialColor(
        MyColors.primaryColor,
      ), // You can use your custom color
      textTheme: const TextTheme(
        bodySmall: TextStyle(fontFamily: 'Poppins-Medium'),
        bodyLarge: TextStyle(fontFamily: 'Poppins-Medium'),
        bodyMedium: TextStyle(fontFamily: 'Poppins-Medium'),
      ),
      appBarTheme: AppBarTheme(
        color: MyColors.myMaterialColor(
          MyColors.primaryColor,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: MyColors.primaryColor,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: MyColors.navigationBarBGColor,
      ),
      scaffoldBackgroundColor: MyColors.scaffoldBGColor, // Customize as needed
    );
  }

  // Load theme from SharedPreferences
  Future<void> loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? savedTheme = prefs.getInt('themeMode');

    // If saved theme exists, update it, otherwise default to system theme
    if (savedTheme != null) {
      themeMode.value = ThemeMode.values[savedTheme];
    } else {
      themeMode.value = ThemeMode.light;  // Default to light theme
    }
  }

  // Save theme to SharedPreferences
  Future<void> updateTheme(ThemeMode mode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themeMode', mode.index);  // Save the index of the themeMode
    themeMode.value = mode;
  }
  @override
  void onInit() {
    loadTheme();
    super.onInit();
  }
}
