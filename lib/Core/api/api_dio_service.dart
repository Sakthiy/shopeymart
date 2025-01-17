import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:shopeymart/CommonFiles/my_colors.dart';

class ApiDioService {
  final Dio dio = Dio();

  Future<T> apiCall<T>({
    required String url,
    required HttpMethod method,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? data,
    bool showErrorDialog = true,
  }) async {
    try {
      Response response;

      // Handling different HTTP methods
      switch (method) {
        case HttpMethod.get:
          response = await dio.get(url, queryParameters: queryParams);
          break;
        case HttpMethod.post:
          response = await dio.post(url, data: data);
          break;
        case HttpMethod.put:
          response = await dio.put(url, data: data);
          break;
        case HttpMethod.delete:
          response = await dio.delete(url, data: data);
          break;
        default:
          throw Exception('Unsupported HTTP method');
      }

      // Check if the status code is successful
      if (response.statusCode == 200) {
        return response.data as T;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      if (showErrorDialog) {
        _showErrorDialog(e.toString());
      }
      rethrow; // Propagate error so calling function can handle it if needed
    }
  }

  // Function to show error dialog
  void _showErrorDialog(String message) {
    Get.defaultDialog(
      title: 'Error',
      middleText: message,
      onConfirm: () => Get.back(),
      textConfirm: 'OK',
      confirmTextColor: MyColors.whiteColor,
    );
  }
}

enum HttpMethod { get, post, put, delete }
