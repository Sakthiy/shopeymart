import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopeymart/Core/api/api_ctrl.dart';
import 'package:shopeymart/Core/api/api_dio_service.dart';
import 'package:shopeymart/Core/api/api_string.dart';
import 'package:shopeymart/UI/Categories/Model/categories_by_products_model.dart';
import 'package:shopeymart/UI/Categories/Model/categories_model.dart';
import 'package:shopeymart/UI/Categories/Model/sub_categories_by_products_model.dart';

class CategoriesCtrl extends GetxController {
  final ApiController apiController = ApiController();
  final categoriesModel = Rxn<CategoriesModel>();
  final categoriesByProductsModel = Rxn<CategoriesByProductsModel>();
  final subCategoriesInerProductsModel = Rxn<CategoriesByProductsModel>();
  final subcategoryModel = Rxn<SubcategoryModel>();
  ScrollController scrollCategoriesCtrl = ScrollController();
  ScrollController scrollSubCategoriesCtrl = ScrollController();
  RxInt wishlistLoaderIndex = 0.obs;
  // RxInt categoriesCurrentIndex = 0.obs;
  RxInt subCategoriesCurrentIndex = 0.obs;
  RxBool isSubCategoriesSelected = false.obs;
  RxString takingCategoriesAllItemsAppBarTitle = ''.obs;
  RxString takingSubCategoriesAppBarTitle = ''.obs;
  RxString takingCategoriesId = ''.obs;
  RxString categoryByProductId = ''.obs;
  RxBool isPageLoader = false.obs;

  getCategoryData() async {
    isPageLoader.value = true;
    categoriesModel.value = null;
    await apiController.fetchData(
      method: HttpMethod.get,
      url: ApiString.categoryUrl,
    );
    isPageLoader.value = false;
    categoriesModel.value = categoriesModelFromJson(apiController.data.value!);
  }

  getCategoryByProducts({String? categoryByProductId}) async {
    categoriesByProductsModel.value = null;
    await apiController.fetchData(
      method: HttpMethod.get,
      url: ApiString.categoryProductsUrl + categoryByProductId!,
    );
    categoriesByProductsModel.value =
        categoriesByProductsModelFromJson(apiController.data.value!);
  }

  getSubCategoryByProducts({String? subCategoryByProductId}) async {
    subcategoryModel.value = null;
    await apiController.fetchData(
      url: ApiString.subcategoryProductsUrl + subCategoryByProductId!,
      method: HttpMethod.get,
    );
    subcategoryModel.value =
        subcategoryModelFromJson(apiController.data.value!);
  }

  getSubCategoryInerProducts({String? categoryByProductId}) async {
    subCategoriesInerProductsModel.value = null;
    await apiController.fetchData(
      method: HttpMethod.get,
      url: ApiString.categoryProductsUrl + categoryByProductId!,
    );
    subCategoriesInerProductsModel.value =
        categoriesByProductsModelFromJson(apiController.data.value!);
  }

  addRemovFavouriteCategories({required int index}) {
    categoriesByProductsModel.value!.data[index].isInWishlist =
        !categoriesByProductsModel.value!.data[index].isInWishlist;
    update();
  }

  addRemovFavouriteSubCategories({required int index}) {
    subCategoriesInerProductsModel.value!.data[index].isInWishlist =
        !subCategoriesInerProductsModel.value!.data[index].isInWishlist;
    update();
  }

  @override
  void onInit() {
    getCategoryData();
    super.onInit();
  }
}
