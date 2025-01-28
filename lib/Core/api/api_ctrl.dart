import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:shopeymart/Core/api/api_dio_service.dart';
import 'package:shopeymart/Core/api/api_string.dart';

class ApiController extends GetxController {
  var isLoading = false.obs;
  var data = Rxn<
      String>(); // You can change String to the actual model type based on your response

  final ApiDioService dioService = ApiDioService();

  // Generic method to handle the API call
  Future<void> fetchData({
    required String url,
    required HttpMethod method,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? data,
    bool useToken = false, 
  }) async {
    isLoading(true); // Set loading state to true

    try {
      final result = await dioService.apiCall(
        url: ApiString.baseUrl + url,
        method: method,
        data: data,
        queryParams: queryParams,
        // useToken: useToken
      ); // Change the generic type accordingly
      log(json.encode(result));
      // this.data.value = result;
      this.data.value = json.encode(result);
    } catch (e) {
      print(
          'API Error: $e'); // This will print the error for debugging purposes
    } finally {
      isLoading(false); // Set loading state to false
    }
  }
}
