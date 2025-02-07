import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shopeymart/CommonFiles/app_strings.dart';
import 'package:shopeymart/CommonFiles/my_bottom_sheet.dart';
import 'package:shopeymart/Core/api/api_ctrl.dart';
import 'package:shopeymart/Core/api/api_dio_service.dart';
import 'package:shopeymart/Core/api/api_string.dart';
import 'package:shopeymart/UI/Categories/Ctrl/categories_ctrl.dart';
import 'package:shopeymart/UI/Favorite/Model/favorite_model.dart';
import 'package:shopeymart/UI/Favorite/Model/favorite_products_model.dart';

class FavoriteCtrl extends GetxController {
  final ApiController apiController = ApiController();
  final CategoriesCtrl categoriesCtrl = Get.find<CategoriesCtrl>();
  final favoriteModel = Rxn<FavoriteModel>();
  final favoriteProductsModel = Rxn<FavoriteProductsModel>();
  RxInt favoriteSubCataIndex = 0.obs;
  RxBool isLoad = true.obs;

  favoritePost({
    required String productId,
  }) async {
    await apiController.fetchData(
      url: ApiString.whislistUrl,
      method: HttpMethod.post,
      data: {'productId': productId},
    );
    favoriteModel.value = favoriteModelFromJson(apiController.data.value!);
    if (favoriteModel.value!.success) {
      MyBottomSheet.showToastMassage(msg: favoriteModel.value!.message);
    }
  }

  favoriteDelete({
    required String productId,
  }) async {
    await apiController.fetchData(
      url: ApiString.whislistUrl,
      method: HttpMethod.delete,
      data: {'productId': productId},
    );
    favoriteModel.value = favoriteModelFromJson(apiController.data.value!);
    if (favoriteModel.value!.success) {
      MyBottomSheet.showToastMassage(msg: favoriteModel.value!.message);
    }
  }

  getFavoriteProduct() async {
    favoriteProductsModel.value = null;
    await apiController.fetchData(
      url: ApiString.whislistUrl,
      method: HttpMethod.get,
    );
    favoriteProductsModel.value =
        favoriteProductsModelFromJson(apiController.data.value!);
  }

  unFavorite({required String productId}) async {
    await apiController.fetchData(
      url: ApiString.whislistUrl,
      method: HttpMethod.delete,
      data: {'productId': productId},
    );
    favoriteModel.value = favoriteModelFromJson(apiController.data.value!);
    if (favoriteModel.value!.success) {
      MyBottomSheet.showToastMassage(msg: favoriteModel.value!.message);
      getFavoriteProduct();
    }
  }
}
