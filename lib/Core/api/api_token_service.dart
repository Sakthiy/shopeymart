// // AuthService for managing token
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shopeymart/PageRoutes/routes_manager.dart';
// import 'package:shopeymart/SharedPreferences/shared_prefer_value.dart';
// import 'package:shopeymart/SharedPreferences/shared_preference.dart';
//
// class ApiTokenService extends GetxController {
//   RxString token = ''.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     _loadToken(); // Load token from SharedPreferences on initialization
//   }
//
//   // Set the token
//   Future<void> setToken(String newToken) async {
//     token.value = newToken;
//     await SharedPreferenceUtils.setString(
//       SharedPrefString.userToken,
//       newToken,
//     ); // Save token in SharedPreferences
//   }
//
//   // Clear the token and redirect to login
//   Future<void> clearToken() async {
//     token.value = '';
//     // final prefs = await SharedPreferenceUtils.init();
//     await SharedPreferenceUtils.removeKey(
//       SharedPrefString.userToken,
//     ); // Remove token from SharedPreferences
//     Get.offNamed(Routes.loginScreen); // Redirect to LoginPage
//   }
//
//   // Check if token is valid
//   bool isTokenValid() {
//     return token.isNotEmpty;
//   }
//
//   // Load the token from SharedPreferences
//   Future<void> _loadToken() async {
//     // final prefs = await SharedPreferenceUtils.init();
//     token.value = SharedPreferenceUtils.getString(SharedPrefString.userToken) ?? '';
//   }
// }
//
// // Middleware to check authentication
// class AuthMiddleware extends GetMiddleware {
//   @override
//   RouteSettings? redirect(String? route) {
//     final authService = Get.find<ApiTokenService>();
//     if (!authService.isTokenValid()) {
//       return const RouteSettings(name: Routes.loginScreen);
//     }
//     return null;
//   }
// }
