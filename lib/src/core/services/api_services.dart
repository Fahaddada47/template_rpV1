import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:riverpod_template/main.dart';
import 'package:riverpod_template/src/application/utils/custom_talkerLog.dart';
import 'package:riverpod_template/src/application/utils/log_message.dart';
import 'package:riverpod_template/src/core/services/network_response.dart';
import 'package:talker_http_logger/talker_http_logger.dart';


class ApiClient {
  ApiClient();
  static const int timeoutRequest = 60;

  final client = InterceptedClient.build(interceptors: [
    TalkerHttpLogger(talker: talker),
  ]);

  static final Map<String, String> _defaultHeaders = {
    'Content-Type': 'application/json',
    'Vary': 'Accept',
  };

  /// Helper to add authorization header
  static Map<String, String> _currentUserHeader(String token) {
    return {
      ..._defaultHeaders,
      'Authorization': 'Bearer $token',
    };
  }

  /// Helper to format timeout error message
  String _errorMessage({String message = 'Request timed out'}) {
    return '{"error": "$message"}';
  }

  /// Centralized response handler
  NetworkResponse _handleResponse(http.Response response) {
    final int statusCode = response.statusCode;
    final Map<String, dynamic> responseBody = jsonDecode(response.body);

    if (statusCode == 200 && responseBody['status'] == true) {
      return NetworkResponse.success(responseBody, statusCode);
    } else {
      final errorMessage = responseBody['message'] ?? 'An error occurred';
      return NetworkResponse.failure(errorMessage, statusCode);
    }
  }

  /// Handles GET requests
  Future<NetworkResponse> getData({
    required String url,
    Uri? uri,
    String? token,
    Map<String, String>? headers,
    int? timeOut,
  }) async {
    final uriToUse = uri ?? Uri.parse(url);
    logMessage(title: "GET request to", message: uriToUse.toString());

    try {
      final response = await client.get(
        uriToUse,
        headers: headers ?? (token != null ? _currentUserHeader(token) : _defaultHeaders),
      ).timeout(Duration(seconds: timeOut ?? timeoutRequest));

      talker.logTyped(ShowResponseLog(
        'GET: ${response.request?.url}\nStatus: ${response.statusCode}\nBody: ${response.body}',
      ));

      return _handleResponse(response);
    } catch (e) {
      return NetworkResponse.failure('Failed to complete GET request', 408);
    }
  }

  /// Handles POST requests
  Future<NetworkResponse> postData({
    required String url,
    dynamic body,
    String? token,
    Map<String, String>? headers,
    int? timeOut,
  }) async {
    logMessage(title: 'POST request to', message: url);

    try {
      final response = await client.post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: headers ?? (token != null ? _currentUserHeader(token) : _defaultHeaders),
      ).timeout(Duration(seconds: timeOut ?? timeoutRequest));

      talker.logTyped(ShowResponseLog(
        'POST: ${response.request?.url}\nBody: ${jsonEncode(body)}\nStatus: ${response.statusCode}\nResponse: ${response.body}',
      ));

      return _handleResponse(response);
    } catch (e) {
      return NetworkResponse.failure('Failed to complete POST request', 408);
    }
  }

  /// Handles DELETE requests
  Future<NetworkResponse> deleteData({
    required String url,
    String? token,
    Map<String, String>? headers,
    int? timeOut,
  }) async {
    logMessage(title: 'DELETE request to', message: url);

    try {
      final response = await client.delete(
        Uri.parse(url),
        headers: headers ?? (token != null ? _currentUserHeader(token) : _defaultHeaders),
      ).timeout(Duration(seconds: timeOut ?? timeoutRequest));

      talker.logTyped(ShowResponseLog(
        'DELETE: ${response.request?.url}\nStatus: ${response.statusCode}\nResponse: ${response.body}',
      ));

      return _handleResponse(response);
    } catch (e) {
      return NetworkResponse.failure('Failed to complete DELETE request', 408);
    }
  }

  /// Handles PUT requests
  Future<NetworkResponse> putData({
    required String url,
    dynamic body,
    String? token,
    Map<String, String>? headers,
    int? timeOut,
  }) async {
    logMessage(title: 'PUT request to', message: url);

    try {
      final response = await client.put(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: headers ?? (token != null ? _currentUserHeader(token) : _defaultHeaders),
      ).timeout(Duration(seconds: timeOut ?? timeoutRequest));

      talker.logTyped(ShowResponseLog(
        'PUT: ${response.request?.url}\nBody: ${jsonEncode(body)}\nStatus: ${response.statusCode}\nResponse: ${response.body}',
      ));

      return _handleResponse(response);
    } catch (e) {
      return NetworkResponse.failure('Failed to complete PUT request', 408);
    }
  }
}
