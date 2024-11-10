
import 'package:riverpod_template/src/core/services/api_services.dart';
import 'package:riverpod_template/src/core/services/network_response.dart';
import 'package:riverpod_template/src/features/user/model/user_model.dart';

class UserApi {
  final ApiClient _apiClient;

  UserApi(this._apiClient);

  Future<List<UserModel>> getUserList() async {
    final NetworkResponse response = await _apiClient.getData(
      url: 'https://jsonplaceholder.typicode.com/users',
    );
    if (response.isSuccess && response.data is List) {
      return (response.data as List)
          .map((json) => UserModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load users: ${response.message ?? 'Unknown error'}');
    }
  }
}
