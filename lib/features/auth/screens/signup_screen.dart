import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter_riverpod_clean_arch/app/routes/routes.dart';
import 'package:gorouter_riverpod_clean_arch/shared/widgets/custom_progress_indicator.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SignUpScreen extends HookWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShadButton(
              enabled: !isLoading.value,
              onPressed: () {
                isLoading.value = true;
                Future.delayed(const Duration(seconds: 2), () {
                  if (!context.mounted) return;
                  isLoading.value = false;
                  // check if user is authenticated (i.e. if we have a stored user model)
                  // if authenticated, navigate to home screen
                  // else navigate to auth screen
                });
              },
              icon: isLoading.value
                  ? CustomProgressIndicator()
                  : const Icon(LucideIcons.mail),
              child:
                  Text(isLoading.value ? 'Please wait' : 'Signup with Email'),
            ),
            ShadButton.link(
              child: const Text('Sign in'),
              onPressed: () => context.goNamed(AppRoutes.signIn.name),
            )
          ],
        ),
      ),
    );
  }
}
