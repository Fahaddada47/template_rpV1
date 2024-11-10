import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_template/src/core/routes/app_routes.dart';

/// The route configuration.
final goRouterProvider = Provider<GoRouter>((ref) {
  return AppRouter.router;
});
