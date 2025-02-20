import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shopeymart/CommonFiles/my_bottom_sheet.dart';
import 'package:shopeymart/Core/api/api_ctrl.dart';
import 'package:shopeymart/Core/api/api_dio_service.dart';
import 'package:shopeymart/Core/api/api_string.dart';
import 'package:shopeymart/UI/CartScreen/Model/car_delete_model.dart';
import 'package:shopeymart/UI/CartScreen/Model/cart_model.dart';

class CartCtrl extends GetxController {
  final apiController = ApiController();
  final cartModel = Rxn<CartModel>();
  final carDeleteModel = Rxn<CarDeleteModel>();
  RxInt selectedQuantity = 0.obs;
  RxList<int> quantityList = <int>[].obs;
  var isPlaceOrderWidget = true.obs;
  var isCarDeleteModel = false.obs;
  var cartCount = 0.obs;

  getCartData() async {
    await apiController.fetchData(
      url: ApiString.addToCart,
      method: HttpMethod.get,
    );
    cartModel.value = cartModelFromJson(apiController.data.value!);
    if (cartModel.value!.success == true) {
      if (kDebugMode) {
        print("Cart Count ===========>  ${cartModel.value!.count!}");
      }
      cartCount.value = cartModel.value!.count!;

      //      for (int i = carDeleteModel.value!.cart.items.first.;
      //     i <= carDeleteModel.value!.data.first.variants.first.stock;
      //     i++) {
      //   quantityList.add(i);
      // }
      MyBottomSheet.showToastMassage(msg: cartModel.value!.message);
    }
  }

  deleteCartData({required String productId, required String variantId}) async {
    isCarDeleteModel.value = true;
    await apiController.fetchData(
        url: ApiString.addToCart,
        method: HttpMethod.delete,
        data: {"productId": productId, "variantId": variantId});
    carDeleteModel.value = carDeleteModelFromJson(apiController.data.value!);
    isCarDeleteModel.value = false;
    getCartData();
    MyBottomSheet.showToastMassage(msg: cartModel.value!.message);
    // if (cartModel.value!.success == true) {
    //
    // }
  }

  @override
  void onInit() {
    getCartData();
    super.onInit();
  }
}
