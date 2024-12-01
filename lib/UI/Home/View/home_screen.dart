import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopeymart/CommonFiles/Theme/Ctrl/theme_change_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Current Theme Mode:'),
            Text(
              context.isDarkMode ? 'Dark' : 'Light',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => MyThemeDialog.showThemeDialog(context),
              child: const Text('Change Theme'),
            ),
          ],
        ),
      ),
    );
  }
}
