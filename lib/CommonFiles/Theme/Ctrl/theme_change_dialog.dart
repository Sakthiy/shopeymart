import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopeymart/CommonFiles/Theme/Ctrl/theme_ctrl.dart';

class MyThemeDialog {
  // Function to show theme dialog with radio buttons
  static showThemeDialog(BuildContext context) {
    // Get the ThemeController instance
    final ThemeCtrl themeController = Get.put(ThemeCtrl());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose Theme'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RadioListTile<ThemeMode>(
                title: const Text('Light Theme'),
                value: ThemeMode.light,
                groupValue: themeController.themeMode.value,
                onChanged: (ThemeMode? value) {
                  if (value != null) {
                    themeController.updateTheme(value);
                    Navigator.of(context).pop();
                  }
                },
              ),
              RadioListTile<ThemeMode>(
                title: const Text('Dark Theme'),
                value: ThemeMode.dark,
                groupValue: themeController.themeMode.value,
                onChanged: (ThemeMode? value) {
                  if (value != null) {
                    themeController.updateTheme(value);
                    Navigator.of(context).pop();
                  }
                },
              ),
              RadioListTile<ThemeMode>(
                title: const Text('System Default'),
                value: ThemeMode.system,
                groupValue: themeController.themeMode.value,
                onChanged: (ThemeMode? value) {
                  if (value != null) {
                    themeController.updateTheme(value);
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}