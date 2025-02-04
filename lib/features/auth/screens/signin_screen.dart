import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter_riverpod_clean_arch/app/providers/auth_provider.dart';
import 'package:gorouter_riverpod_clean_arch/app/routes/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:gorouter_riverpod_clean_arch/shared/widgets/custom_progress_indicator.dart';

class SignInScreen extends HookConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShadButton(
              enabled: !ref.watch(authProvider).isLoading,
              onPressed: () async {
                await ref
                    .read(authProvider.notifier)
                    .login('natalieh', 'nataliehpass')
                    .then((result) {
                  if (result.isSucces) {
                    context.goNamed(AppRoutes.home.name);
                  }
                });
              },
              icon: ref.watch(authProvider).isLoading
                  ? CustomProgressIndicator()
                  : const Icon(LucideIcons.mail),
              child: Text(ref.watch(authProvider).isLoading
                  ? 'Please wait'
                  : 'Login with Email'),
            ),
            ShadButton.link(
              child: const Text('Sign up'),
              onPressed: () => context.goNamed(AppRoutes.signUp.name),
            )
          ],
        ),
      ),
    );
  }
}
