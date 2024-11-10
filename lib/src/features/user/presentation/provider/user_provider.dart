
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_template/src/core/services/api_client_provider.dart';
import 'package:riverpod_template/src/features/user/data/data_source/user_api.dart';
import 'package:riverpod_template/src/features/user/model/user_model.dart';

class AsyncUserNotifier extends AsyncNotifier<List<UserModel>> {
  late final UserApi _userApi;

  @override
  Future<List<UserModel>> build() async {
    _userApi = ref.read(userApiProvider); // Initialize the API service
    return await _userApi.getUserList();  // Fetch and return user list
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading(); // Set loading state
    try {
      final users = await _userApi.getUserList(); // Fetch fresh data
      state = AsyncValue.data(users); // Update with new data
    } catch (e, stack) {
      state = AsyncValue.error(e, stack); // Handle errors
    }
  }
}


// Provider for AsyncNotifier
final asyncUserProvider = AsyncNotifierProvider<AsyncUserNotifier, List<UserModel>>(
      () => AsyncUserNotifier(),
);

// Provider for UserApi
final userApiProvider = Provider<UserApi>((ref) {
  final apiClient = ref.read(apiClientProvider); // Ensure this is defined
  return UserApi(apiClient);
});
