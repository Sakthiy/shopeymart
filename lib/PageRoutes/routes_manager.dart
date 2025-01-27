import 'package:get/get.dart';
import 'package:shopeymart/Payments/View/payment_screen.dart';
import 'package:shopeymart/UI/Categories/View/Categories_all_items.dart';
import 'package:shopeymart/UI/Categories/View/sub_category_product.dart';
import 'package:shopeymart/UI/Dashboard/View/dash_board_screen.dart';
import 'package:shopeymart/UI/ForgotPassword/View/create_new_password.dart';
import 'package:shopeymart/UI/ForgotPassword/View/forgot_password.dart';
import 'package:shopeymart/UI/ForgotPassword/View/otp_password.dart';
import 'package:shopeymart/UI/Home/View/home_screen.dart';
import 'package:shopeymart/UI/Login/View/login_screen.dart';
import 'package:shopeymart/UI/Login/View/signup_screen.dart';
import 'package:shopeymart/UI/Menu/Settings/settings_screen.dart';
import 'package:shopeymart/UI/ProductsDetails/View/product_details_screen.dart';
import 'package:shopeymart/UI/SplashScreen/View/splash_screen.dart';

class Routes {
  static const splashScreen = '/splashScreen';
  static const homeScreen = '/homeScreen';
  static const dashBoardScreen = '/dashBoardScreen';
  static const settingsScreen = '/settingsScreen';
  static const paymentScreen = '/paymentScreen';
  static const searchScreen = '/searchScreen';
  static const categoriesAllItems = '/categoriesAllItems';
  static const loginScreen = '/loginScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const createPasswordScreen = '/createPasswordScreen';
  static const forgetOTPPasswordScreen = '/forgetOTPPasswordScreen';
  static const signupScreen = '/signupScreen';
  static const productDetailsScreen = '/productDetailsScreen';
  static const subCategoryProductScreen = '/SubCategoryProductScreen';
}

class RouteManager {
  static const initial = Routes.splashScreen;

  // List Pages
  static List<GetPage> getPages() {
    return [
      GetPage(name: Routes.splashScreen, page: () => const SplashScreen()),
      GetPage(
        name: Routes.homeScreen,
        page: () => const HomeScreen(),
        // middlewares: [AuthMiddleware()],
      ),
      GetPage(
        name: Routes.dashBoardScreen,
        page: () => const DashBoardScreen(),
        // middlewares: [AuthMiddleware()],
      ),
      GetPage(name: Routes.settingsScreen, page: () => const SettingsScreen()),
      GetPage(name: Routes.paymentScreen, page: () => const PaymentScreen()),
      GetPage(
          name: Routes.categoriesAllItems,
          page: () => const CategoriesAllItems()),
      GetPage(name: Routes.loginScreen, page: () => const LoginScreen()),
      GetPage(
          name: Routes.forgotPasswordScreen,
          page: () => const ForgotPassword()),
      GetPage(
          name: Routes.createPasswordScreen,
          page: () => const CreateNewPassword()),
      GetPage(
          name: Routes.forgetOTPPasswordScreen,
          page: () => const ForgetOTPPassword()),
      GetPage(name: Routes.signupScreen, page: () => const SignupScreen()),
      GetPage(
          name: Routes.productDetailsScreen,
          page: () => const ProductDetailsScreen()),
      GetPage(
          name: Routes.subCategoryProductScreen,
          page: () => const SubCategoryProductScreen()),
    ];
  }
}
