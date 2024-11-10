import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_template/src/features/auth/data/data_source/auth_api.dart';
import 'package:riverpod_template/src/features/auth/model/login_response_model.dart';
import 'package:riverpod_template/src/features/auth/presentation/provider/auth_api_provider.dart';

class AuthNotifier extends AsyncNotifier<LoginResponseModel?> {
  late final AuthApi _authApi;

  @override
  Future<LoginResponseModel?> build() async {
    _authApi = (ref.read(authApiProvider));
    return null;
  }

  Future<void> loginUser(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final response = await _authApi.loginUser( email: email, password: password);
      state = AsyncValue.data(response);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}

final authProvider = AsyncNotifierProvider<AuthNotifier, LoginResponseModel?>(
      () => AuthNotifier(),
);
