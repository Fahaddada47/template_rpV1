import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_template/src/application/route_error_screen.dart';
import 'package:riverpod_template/src/features/auth/presentation/auth_routes.dart';
import 'package:riverpod_template/src/features/auth/presentation/view/screens/auth_screen.dart';
import 'package:riverpod_template/src/features/auth/presentation/view/screens/splash_screen.dart';

class AppRouter {
  AppRouter._();

  static GoRouter get router => _router;

  static final GlobalKey<NavigatorState> globalKey =
  GlobalKey<NavigatorState>();

  static final _router = GoRouter(
    initialLocation: SplashScreen.name,
    navigatorKey: globalKey,
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) {
            return const SplashScreen();
          }),
       ...AuthRoutes.routes,
      // ...MainMenuRoutes.routes,
    ],
    errorBuilder: (context, state) {
      return RouteErrorScreen(
        message: state.error.toString(),
      );
    },
  );

  static void go(BuildContext context, String name,
      {Map<String, String> pathParameters = const <String, String>{},
        Map<String, dynamic> queryParameters = const <String, dynamic>{},
        Object? extra}) {
    context.goNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  static void replace(BuildContext context, String name,
      {Map<String, String> pathParameters = const <String, String>{},
        Map<String, dynamic> queryParameters = const <String, dynamic>{},
        Object? extra}) {
    context.replaceNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  static void push(BuildContext context, String name, {Object? extra}) {
    context.push(name, extra: extra);
  }

  static void pop(BuildContext context, {Object? result}) {
    context.pop(result);
  }
}
