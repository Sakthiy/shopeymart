import 'package:flutter/material.dart';
import 'package:shopeymart/CommonFiles/app_strings.dart';
import 'package:shopeymart/Payments/Ctrl/payment_ctrl.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final PaymentCtrl paymentCtrl = PaymentCtrl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: paymentCtrl.getInfo,
          child: Text(AppStrings.proceedToPayment),
        ),
      ),
    );
  }
}
