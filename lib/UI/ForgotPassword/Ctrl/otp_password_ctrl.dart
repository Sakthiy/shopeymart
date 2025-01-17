import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopeymart/UI/ForgotPassword/Ctrl/forgot_password_ctrl.dart';

class OTPPasswordCtrl extends GetxController {
  TextEditingController otpTextEditingCtrl = TextEditingController();
  RxString mobileNumber = ''.obs;
  final formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    mobileNumber.value = Get.put(ForgotPasswordCtrl()).emailOrPhoneCtrl.text;
  }
}
