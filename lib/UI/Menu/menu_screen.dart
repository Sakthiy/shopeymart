import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopeymart/CommonFiles/app_strings.dart';
import 'package:shopeymart/PageRoutes/routes_manager.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => Get.toNamed(Routes.settingsScreen),
          title: Text(AppStrings.settings),
        )
      ],
    );
  }
}
