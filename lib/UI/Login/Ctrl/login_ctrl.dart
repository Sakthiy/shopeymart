import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopeymart/CommonFiles/app_strings.dart';
import 'package:shopeymart/CommonFiles/my_colors.dart';
import 'package:shopeymart/Core/api/api_ctrl.dart';
import 'package:shopeymart/Core/api/api_dio_service.dart';
import 'package:shopeymart/Core/api/api_string.dart';
import 'package:shopeymart/Core/toast_helper.dart';
import 'package:shopeymart/PageRoutes/routes_manager.dart';
import 'package:shopeymart/SharedPreferences/shared_prefer_value.dart';
import 'package:shopeymart/SharedPreferences/shared_preference.dart';
import 'package:shopeymart/UI/Login/Model/login_res_model.dart';

class LoginCtrl extends GetxController {
  final ApiController apiController = ApiController();
  RxBool isAutoValidator = false.obs;
  RxBool isLoginLoader = false.obs;
  RxString? userToken = ''.obs;
  TextEditingController emailCtrl =
      TextEditingController(text: 'lachanakumar1@gmail.com');
  TextEditingController passwordCtrl = TextEditingController(text: '12345');
  final formKey = GlobalKey<FormState>();

  Rx<LoginResModel?> loginResModel = Rxn<LoginResModel>();

  loginFunc({required String email, required String password}) async {
    isLoginLoader.value = true;
    update();
    Map<String, dynamic> data = {
      "email": email,
      // "phoneno" : "9047882678",
      "password": password
    };
    await apiController.fetchData(
      method: HttpMethod.post,
      url: ApiString.loginUrl,
      data: data,
    );

    loginResModel.value = loginResModelFromJson((apiController.data.value!));
    if (loginResModel.value != null) {
      if (loginResModel.value!.message == AppStrings.invalidCredentials) {
        isLoginLoader.value = false;
        update();
        _showErrorDialog(loginResModel.value!.message);
      } else if (loginResModel.value!.message ==
          AppStrings.successfullyLoggedIn) {
        // bool result =
        await SharedPreferValue.setToken(
          userToken: loginResModel.value!.token!,
        );
        loginChecker();
        ToastHelper.showSuccessToast(AppStrings.successfullyLoggedIn);
      } else {
        isLoginLoader.value = false;
        update();
        _showErrorDialog(loginResModel.value!.message);
      }
    }
  }

  // Function to show error dialog
  void _showErrorDialog(String message) {
    Get.defaultDialog(
      title: 'Error',
      barrierDismissible: false,
      middleText: message,
      onWillPop: () async => false,
      onConfirm: () => Get.back(),
      textConfirm: 'OK',
      confirmTextColor: MyColors.whiteColor,
    );
  }

  loginChecker() {
    // Fetch the token from SharedPreferences
    String? token = SharedPreferenceUtils.getString(SharedPrefString.userToken);

    if (token != null && token.isNotEmpty) {
      // If a valid token exists, assign it and navigate to the dashboard
      userToken!.value = token;
      Get.toNamed(Routes.dashBoardScreen);
    } else {
      // If no valid token, navigate to the login screen
      Get.offAllNamed(Routes.loginScreen);
    }
  }

  logOut() {
    SharedPreferValue.clearAllKeys;
  }

  @override
  void onInit() {
    loginChecker();
    super.onInit();
  }
}
