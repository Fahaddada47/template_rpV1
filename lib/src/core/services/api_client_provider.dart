import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/api_services.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});
