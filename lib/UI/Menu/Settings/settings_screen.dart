import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopeymart/CommonFiles/Theme/Ctrl/theme_change_dialog.dart';
import 'package:shopeymart/CommonFiles/Theme/Ctrl/theme_ctrl.dart';
import 'package:shopeymart/CommonFiles/app_strings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final ThemeCtrl themeController = Get.put(ThemeCtrl());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  onTap: () => MyThemeDialog.showThemeDialog(context),
                  title: Text(
                      '${AppStrings.currentThemeMode} ${themeController.themeMode.value.toString().replaceAll('ThemeMode.', '').capitalize}'),
                )
              ],
            ),
          )),
    );
  }
}
