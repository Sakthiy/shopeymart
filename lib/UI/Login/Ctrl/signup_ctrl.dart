import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopeymart/FirebaseCore/auth_controller.dart';

class SignupCtrl extends GetxController {
  TextEditingController emailOrPhoneNoTextCtrl = TextEditingController();
  TextEditingController passwordTextCtrl = TextEditingController();
  TextEditingController confirmPasswordTextCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxBool isPasswordView = false.obs;
  RxBool isConfirmPasswordView = false.obs;

  passwordView() {
    isPasswordView.value = !isPasswordView.value;
  }

  confirmPasswordView() {
    isConfirmPasswordView.value = !isConfirmPasswordView.value;
  }

  void phoneAuthentication(String phoneNo) {
    // AuthController().phoneNumAuth(phoneNo);
  }
}
