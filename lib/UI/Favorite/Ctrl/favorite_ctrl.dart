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
import 'package:shopeymart/UI/Favorite/Model/favorite_products_model.dart';

class FavoriteCtrl extends GetxController {
  final ApiController apiController = ApiController();
  final CategoriesCtrl categoriesCtrl = Get.put(CategoriesCtrl());
  final favoriteModel = Rxn<FavoriteModel>();
  final favoriteProductsModel = Rxn<FavoriteProductsModel>();
  RxInt favoriteIndex = 0.obs;
  RxInt favoriteSubCataIndex = 0.obs;
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
      await apiController.fetchData(
        url: ApiString.whislistUrl,
        useToken: true,
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
          categoriesCtrl.update();
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

  getFavoriteProductes() async {
    String? token = SharedPreferenceUtils.getString(SharedPrefString.userToken);
    if (token != null && token.isNotEmpty) {
      await apiController.fetchData(
        url: ApiString.whislistUrl,
        method: HttpMethod.get,
        useToken: true,
      );
      favoriteProductsModel.value =
          favoriteProductsModelFromJson(apiController.data.value!);
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
