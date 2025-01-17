import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class ToastHelper {
  // Generic function to show a toast
  static void showToast(String message, {
    ToastGravity gravity = ToastGravity.BOTTOM,
    int durationInSeconds = 3,
    Color? backgroundColor,
    Color? textColor,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity, // Gravity position (top, bottom, center)
      timeInSecForIosWeb: durationInSeconds,
      backgroundColor: backgroundColor ?? Colors.black.withOpacity(0.7),
      textColor: textColor ?? Colors.white,
      fontSize: 16.0,
    );
  }

  // Show success toast
  static void showSuccessToast(String message) {
    showToast(
      message,
      backgroundColor: Colors.green,
    );
  }

  // Show error toast
  static void showErrorToast(String message) {
    showToast(
      message,
      backgroundColor: Colors.red,
    );
  }

  // Show info toast
  static void showInfoToast(String message) {
    showToast(
      message,
      backgroundColor: Colors.blue,
    );
  }

  // Show warning toast
  static void showWarningToast(String message) {
    showToast(
      message,
      backgroundColor: Colors.orange,
    );
  }
}
