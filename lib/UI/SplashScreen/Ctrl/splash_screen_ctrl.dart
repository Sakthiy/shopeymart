import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:shopeymart/UI/Login/Ctrl/login_ctrl.dart';

class SplashScreenCtrl extends GetxController {
  final Connectivity connectivity = Connectivity();
  final ConnectivityResult connectivityResult = ConnectivityResult.none;
  var isInternet = true.obs;
  @override
  void onInit() {
    Timer(
      const Duration(seconds: 3),
      () {
        // Get.put(AuthController()).initialized;
        Get.put(LoginCtrl()).initialized;
      },
    );
    super.onInit();
    connectivity.onConnectivityChanged.listen((result) {
      if (connectivityResult == ConnectivityResult.mobile) {
        isInternet.value = true;
      } else if (connectivityResult == ConnectivityResult.wifi) {
        isInternet.value = true;
      } else {
        // Get.toNamed(Routes.noInternetScreen);
        isInternet.value = false;
      }
    });
  }
}
