import 'package:get/get.dart';
import 'package:shopeymart/UI/Dashboard/View/dash_board_screen.dart';
import 'package:shopeymart/UI/Home/View/home_screen.dart';
import 'package:shopeymart/UI/Menu/Settings/settings_screen.dart';
import 'package:shopeymart/UI/SplashScreen/View/splash_screen.dart';

class Routes {
  static const splashScreen = '/splashScreen';
  static const homeScreen = '/homeScreen';
  static const dashBoardScreen = '/dashBoardScreen';
  static const settingsScreen = '/settingsScreen';
}

class RouteManager {
  static const initial = Routes.splashScreen;

  // List Pages
  static List<GetPage> getPages() {
    return [
      GetPage(name: Routes.splashScreen, page: () => const SplashScreen()),
      GetPage(name: Routes.homeScreen, page: () => const HomeScreen()),
      GetPage(
          name: Routes.dashBoardScreen, page: () => const DashBoardScreen()),
      GetPage(
          name: Routes.settingsScreen, page: () => const SettingsScreen()),
    ];
  }
}
