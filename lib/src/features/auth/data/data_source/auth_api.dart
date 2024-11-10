import 'dart:convert';

import 'package:riverpod_template/src/application/url/base_url.dart';
import 'package:riverpod_template/src/core/services/api_exception.dart';
import 'package:riverpod_template/src/core/services/api_services.dart';
import 'package:riverpod_template/src/core/services/network_response.dart';
import 'package:riverpod_template/src/features/auth/model/login_response_model.dart';


class AuthApi {
  final ApiClient _apiClient;

  AuthApi(this._apiClient);

  Future<LoginResponseModel> loginUser({
    required String email,
    required String password,
  }) async {
    final NetworkResponse response = await _apiClient.postData(
      url: Urls.login,
      body: {'email': email, 'password': password},
    );
    if (response.isSuccess && response.statusCode == 200) {
      return LoginResponseModel.fromJson(response.data);
    } else {
      throw ApiException(
        message: response.message ?? 'Login failed',
        statusCode: response.statusCode,
      );
    }
  }
}
