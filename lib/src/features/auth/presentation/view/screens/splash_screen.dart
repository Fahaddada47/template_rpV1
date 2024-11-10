import 'package:flutter/material.dart';
import 'package:riverpod_template/src/core/routes/app_routes.dart';
import 'package:riverpod_template/src/features/auth/presentation/view/screens/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String name = '/splashScreen';


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      AppRouter.go(context,LoginScreen.name);
    });
  }


  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(child: Text("Splash Screen"),),
    );
  }
}
