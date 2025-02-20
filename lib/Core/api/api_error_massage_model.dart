// To parse this JSON data, do
//
//     final apiErrorMassageModel = apiErrorMassageModelFromJson(jsonString);

import 'dart:convert';

ApiErrorMassageModel apiErrorMassageModelFromJson(String str) => ApiErrorMassageModel.fromJson(json.decode(str));

String apiErrorMassageModelToJson(ApiErrorMassageModel data) => json.encode(data.toJson());

class ApiErrorMassageModel {
  bool success;
  String message;

  ApiErrorMassageModel({
    required this.success,
    required this.message,
  });

  factory ApiErrorMassageModel.fromJson(Map<String, dynamic> json) => ApiErrorMassageModel(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
