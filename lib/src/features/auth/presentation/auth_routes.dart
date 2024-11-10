import 'package:go_router/go_router.dart';
import 'package:riverpod_template/src/features/auth/presentation/view/screens/auth_screen.dart';
import 'package:riverpod_template/src/features/auth/presentation/view/screens/splash_screen.dart';

class AuthRoutes {
  static List<GoRoute> routes = [
    GoRoute(
      path: SplashScreen.name,
      name: SplashScreen.name,
      builder: (context, state) {
        return  const SplashScreen();
      },
    ),
    GoRoute(
      path: LoginScreen.name,
      name: LoginScreen.name,
      builder: (context, state) {
        return   LoginScreen();
      },
    ),
  ];
}