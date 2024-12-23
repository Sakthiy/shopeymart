import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shopeymart/CommonFiles/app_strings.dart';
import 'package:shopeymart/CommonFiles/my_colors.dart';
import 'package:shopeymart/CommonFiles/text_form_field.dart';

class PaymentCtrl extends GetxController {
  Razorpay razorpay = Razorpay();
  final TextEditingController nameTextEditCtrl = TextEditingController();
  final TextEditingController phoneNumTextEditCtrl = TextEditingController();
  final TextEditingController emailTextEditCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    // paymentCtrl.showAlertDialog(context, "Payment Failed",
    //     "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
    Get.defaultDialog(
        onCancel: () => razorpay.clear(),
        title: 'Payment Failed',
        content: Text(
            'Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}'));
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    // paymentCtrl.showAlertDialog(
    //     context, "Payment Successful", "Payment ID: ${response.paymentId}");
    Get.defaultDialog(
        onCancel: () => razorpay.clear(),
        title: 'Payment Successful',
        content:
            Text('Payment Successful", "Payment ID: ${response.paymentId}'));
  }

  getInfo() {
    Get.defaultDialog(
        title: 'Add Info',
        barrierDismissible: false,
        content: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                MyTextFormField(
                  controller: nameTextEditCtrl,
                  label: 'Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Name';
                    }
                    return null;
                  },
                ),
                MyTextFormField(
                  controller: phoneNumTextEditCtrl,
                  label: 'Mobile Number',
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null; // Return null when the input is valid
                  },
                ),
                MyTextFormField(
                  controller: emailTextEditCtrl,
                  textInputAction: TextInputAction.next,
                  label: 'Email',
                  validator: (value) {
                    final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value);
                    if (!emailValid) {
                      return AppStrings.checkYourMail;
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        textConfirm: AppStrings.proceedToPayment,
        confirmTextColor: MyColors.whiteColor,
        onCancel: () {
          nameTextEditCtrl.clear();
          emailTextEditCtrl.clear();
          phoneNumTextEditCtrl.clear();
        },
        onConfirm: () async {
          if (formKey.currentState!.validate()) {
            Get.back();
            await proceedToPayment();
          }
        });
  }

  proceedToPayment() {
    Map<String, dynamic> options = {
      'key': 'rzp_test_5JTaaPL8FpgEPO',
      'amount': 100,
      'currency': 'INR',
      'name': nameTextEditCtrl.text,
      // 'order_id': 'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
      'description': nameTextEditCtrl.text,
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {
        'contact': phoneNumTextEditCtrl.text,
        'email': emailTextEditCtrl.text
      },
      // 'external': {
      //   'wallets': ['paytm']
      // }
    };
    try {
      if (kDebugMode) {
        print("Pay out ===> $options");
      }
      razorpay.open(options);
      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
      nameTextEditCtrl.clear();
      emailTextEditCtrl.clear();
      phoneNumTextEditCtrl.clear();
    } on Exception catch (e) {
      // TODO Payment Exception
      if (kDebugMode) {
        print('Payment Exception ========> $e');
      }
    }
  }

  String? validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  @override
  void dispose() {
    // TODO: Razorpay Payment dispose
    razorpay.clear(); // Removes all listeners
    super.dispose();
  }
}
