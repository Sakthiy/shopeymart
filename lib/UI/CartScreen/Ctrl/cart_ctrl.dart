import 'package:get/get.dart';
import 'package:shopeymart/Core/api/api_ctrl.dart';

class CartCtrl extends GetxController{
  final apiController = ApiController();
  RxInt selectedQuantity = 0.obs;
  RxList<int> quantityList = <int>[].obs;
}

///    for (int i = productModel.value!.data.first.minOrderQty;
//         i <= productModel.value!.data.first.variants.first.stock;
//         i++) {
//       quantityList.add(i);
//     }