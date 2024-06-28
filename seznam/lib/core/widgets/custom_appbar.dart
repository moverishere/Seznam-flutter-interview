import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seznam/routing/route_constants.dart';
import 'package:seznam/theme/theme_provider.dart';

class CustomScaffold extends ConsumerWidget implements PreferredSizeWidget {
  const CustomScaffold({
    super.key,
    required this.title,
    required this.body,
    this.showBackButton = false,
  });

  final String title;
  final bool showBackButton;
  final Widget body;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.watch(themeNotifierProvider.notifier);
    final isDarkMode = ref.watch(themeNotifierProvider) == ThemeMode.dark;

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: showBackButton
              ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    final goRouter = GoRouter.of(context);
                    if (goRouter.canPop()) {
                      goRouter.pop();
                    } else {
                      context.goNamed(RouteConstansts.home);
                    }
                  })
              : null,
          actions: [
            IconButton(
              icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: () {
                themeNotifier.toggleTheme();
              },
            ),
          ],
        ),
        body: body);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
