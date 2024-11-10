import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_template/src/core/services/api_client_provider.dart';
import 'package:riverpod_template/src/features/auth/data/data_source/auth_api.dart';

final authApiProvider = Provider<AuthApi>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return AuthApi(apiClient);
});
