
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopeymart/Core/api/api_ctrl.dart';
import 'package:shopeymart/Core/api/api_dio_service.dart';
import 'package:shopeymart/Core/api/api_string.dart';
import 'package:shopeymart/UI/Categories/Model/categories_by_products_model.dart';
import 'package:shopeymart/UI/Categories/Model/categories_model.dart';

class CategoriesCtrl extends GetxController {
  final ApiController apiController = ApiController();
  final categoriesModel = Rxn<CategoriesModel>();
  final categoriesByProductsModel = Rxn<CategoriesByProductsModel>();
  ScrollController scrollCategoriesCtrl = ScrollController();
  ScrollController scrollSubCategoriesCtrl = ScrollController();
  RxInt categoriesCurrentIndex = 0.obs;
  RxInt subCategoriesCurrentIndex = 0.obs;
  RxBool isSubCategoriesSelected = false.obs;
  RxString takingCategoriesAllItemsAppBarTitle = ''.obs;
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

  getCategoryByProducts() async {
    categoriesByProductsModel.value = null;
    await apiController.fetchData(
      method: HttpMethod.get,
      url: ApiString.categoryProductsUrl,
    );
    categoriesByProductsModel.value = categoriesByProductsModelFromJson(apiController.data.value!);
  }

  @override
  void onInit() {
    getCategoryData();
    super.onInit();
  }
}
