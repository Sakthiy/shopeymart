import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:shopeymart/CommonFiles/my_bottom_sheet.dart';
import 'package:shopeymart/PageRoutes/routes_manager.dart';
import 'package:shopeymart/UI/ForgotPassword/Ctrl/otp_password_ctrl.dart';

class ForgotPasswordCtrl extends GetxController {
  TextEditingController emailOrPhoneCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  apiCall(BuildContext context, String mobileNumber) async {
    final bool? result = await getOtp(context, mobileNumber);
    if (result!) Get.toNamed(Routes.forgetOTPPasswordScreen);
  }

  Future<bool?> getOtp(BuildContext context, String mobileNumber) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: mobileNumber,
        verificationCompleted: (PhoneAuthCredential credential) {
          Get.put(OTPPasswordCtrl()).otpTextEditingCtrl.setText(
                credential.smsCode!,
              );
        },
        verificationFailed: (FirebaseAuthException e) {
          MyBottomSheet.mySnackBar(context, e.toString());
        },
        codeSent: (String verificationId, int? resendToken) {},
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      return true;
    } on Exception catch (e) {
      MyBottomSheet.myDialog(message: e.toString(), errorCode: '');
    }
    return null;
  }
}
