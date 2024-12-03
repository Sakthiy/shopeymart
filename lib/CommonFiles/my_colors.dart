import 'package:flutter/material.dart';

class MyColors {
  static MaterialColor myMaterialColor(Color color) {
    return MaterialColor(
      color.value,
      <int, Color>{
        50: color.withOpacity(0.1),
        100: color.withOpacity(0.2),
        200: color.withOpacity(0.3),
        300: color.withOpacity(0.4),
        400: color.withOpacity(0.5),
        500: color, // The base color
        600: color.withOpacity(0.7),
        700: color.withOpacity(0.8),
        800: color.withOpacity(0.9),
        900: color.withOpacity(1.0),
      },
    );
  }

  static Color whiteColor = Colors.white;
  static Color blackColor = Colors.black;
  static Color redColor = Colors.red;
  static Color orangeColor = Colors.orange;
  static Color greenColor = Colors.green;
  static Color blackColor54 = Colors.black54;
  static Color greyColor = Colors.grey;
  static Color transparent = Colors.transparent;
  static Color primaryColor = const Color(0xFF1D4ED8);

  /// Dark Theme Colors
  static Color navigationBarBGColor = const Color(0xff373c4b);
  static Color scaffoldBGColor = const Color(0xff21242d);
  static Color lightBlueBGColor = const Color(0xffe3eeff);
}
