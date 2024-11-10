import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_template/src/application/common/widgets/center_circular_progress_indicator.dart';
import 'package:riverpod_template/src/application/common/widgets/shimmerEffect.dart';
import 'package:riverpod_template/src/application/common/widgets/snack_message.dart';
import 'package:riverpod_template/src/features/auth/model/login_response_model.dart';
import 'package:riverpod_template/src/features/auth/presentation/provider/auth_provider.dart';
import '../../../../../core/services/api_exception.dart';

class LoginScreen extends ConsumerWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  static const String name = '/loginScreen';


  LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    ref.listen<AsyncValue<LoginResponseModel?>>(authProvider, (previous, next) {
      next.when(
        data: (data) {
          if (data != null) {
            showSnackMessage(
              type: SnackMessageType.success,
              message: '${data.message}.',
              context: context,
            );
          }
        },
        error: (error, _) {
          String errorMessage = error is ApiException
              ? error.message
              : 'An unknown error occurred';
          showSnackMessage(
            type: SnackMessageType.error,
            message: '${errorMessage}.',
            context: context,
          );
        },
        loading: () {
          return const ShimmerEffect();
        },
      );
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final email = emailController.text;
                final password = passwordController.text;
                ref.read(authProvider.notifier).loginUser(email, password);
              },
              child: authState.isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
