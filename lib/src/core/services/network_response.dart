import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  final dynamic data;
  final String? message;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.data,
    this.message,
  });

  factory NetworkResponse.success(dynamic data, int statusCode) {
    return NetworkResponse(
      isSuccess: true,
      statusCode: statusCode,
      data: data,
    );
  }

  factory NetworkResponse.failure(String message, int statusCode) {
    return NetworkResponse(
      isSuccess: false,
      statusCode: statusCode,
      message: message,
    );
  }

  /// Parse response from `http.Response`
  factory NetworkResponse.fromHttpResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return NetworkResponse.success(
          jsonDecode(response.body), response.statusCode);
    } else {
      return NetworkResponse.failure(
          response.reasonPhrase ?? 'Error occurred', response.statusCode);
    }
  }
}
