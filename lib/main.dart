import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopeymart/CommonFiles/Theme/Ctrl/theme_ctrl.dart';
import 'package:shopeymart/FirebaseCore/firebase_options.dart';
import 'package:shopeymart/PageRoutes/routes_manager.dart';
import 'package:shopeymart/SharedPreferences/shared_preference.dart';
import 'package:shopeymart/UI/CartScreen/View/cart_screen.dart';
import 'package:shopeymart/UI/SplashScreen/View/no_internet_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPreferenceUtils.init();
  // await firebaseInitialization.then((value) {
  //   // Get.put(AuthController());
  // });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // Instantiate the ThemeController
  final ThemeCtrl themeCtrl = Get.put(ThemeCtrl());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (context, child) => Obx(
        () => GetMaterialApp(
          initialRoute: RouteManager.initial,
          themeMode: themeCtrl.themeMode.value,
          theme: themeCtrl.lightTheme,
          darkTheme: themeCtrl.darkTheme,
          getPages: RouteManager.getPages(),
          // home: const CartScreen(),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(0.80)),
              child: child!,
            );
          },
        ),
      ),
    );
  }
}
