import 'package:get/get.dart';
import 'package:shopeymart/CommonFiles/app_strings.dart';
import 'package:shopeymart/CommonFiles/my_bottom_sheet.dart';
import 'package:shopeymart/Core/api/api_ctrl.dart';
import 'package:shopeymart/Core/api/api_dio_service.dart';
import 'package:shopeymart/Core/api/api_string.dart';
import 'package:shopeymart/PageRoutes/routes_manager.dart';
import 'package:shopeymart/SharedPreferences/shared_prefer_value.dart';
import 'package:shopeymart/SharedPreferences/shared_preference.dart';
import 'package:shopeymart/UI/Categories/Ctrl/categories_ctrl.dart';
import 'package:shopeymart/UI/Favorite/Model/favorite_model.dart';

class FavoriteCtrl extends GetxController {
  final ApiController apiController = ApiController();
  final CategoriesCtrl categoriesCtrl = Get.put(CategoriesCtrl());
  final favoriteModel = Rxn<FavoriteModel>();
  RxInt favoriteIndex = 0.obs;
  RxBool isLoad = true.obs;
  Future<bool> loader() async {
    await Future.delayed(const Duration(seconds: 2), () {
      isLoad.value = false;
      update();
    });
    print(isLoad.value);
    return isLoad.value;
  }

  favoritePostDelete({
    required String productId,
    required bool isFavourite,
    required int index,
  }) async {
    String? token = SharedPreferenceUtils.getString(SharedPrefString.userToken);
    if (token != null && token.isNotEmpty) {
      print(
          'Favourite $index ========> ${categoriesCtrl.categoriesByProductsModel.value!.data[index].isInWishlist}');
      await apiController.fetchData(
        url: ApiString.whislistUrl,
        method: isFavourite ? HttpMethod.delete : HttpMethod.post,
        data: {'productId': productId},
      );
      favoriteModel.value = favoriteModelFromJson(apiController.data.value!);
      if (favoriteModel.value!.wishlist.products.isNotEmpty) {
        for (var val in favoriteModel.value!.wishlist.products) {
          val == productId
              ? categoriesCtrl.categoriesByProductsModel.value!.data[index]
                  .isInWishlist = true
              : categoriesCtrl.categoriesByProductsModel.value!.data[index]
                  .isInWishlist = false;
          print(
              'Favourite========> ${categoriesCtrl.categoriesByProductsModel.value!.data[index].isInWishlist}');
        }
      }
    } else {
      MyBottomSheet.myDialog(
        message: AppStrings.wishlistLoginDialog,
        errorCode: 'Login',
        isError: false,
        onConfirm: () => Get.offAllNamed(Routes.loginScreen),
      );
    }
  }

  @override
  void onInit() {
    loader();
    super.onInit();
  }
}
