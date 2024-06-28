import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seznam/core/widgets/custom_appbar.dart';
import 'package:seznam/features/users/providers/user_provider.dart';
import 'package:seznam/routing/route_constants.dart';

class UserScreen extends ConsumerWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsyncValue = ref.watch(usersProvider);
    final themeColors = Theme.of(context).colorScheme;

    return CustomScaffold(
      title: 'Users',
      body: usersAsyncValue.when(
        data: (users) => RefreshIndicator(
          onRefresh: () => ref.refresh(usersProvider.future),
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              final isEven = index % 2 == 0;
              return ListTile(
                tileColor: isEven ? themeColors.surfaceContainer : null, 
                title: Text(user.name),
                subtitle: Text(user.email),
                onTap: () => context.goNamed(
                  RouteConstansts.userDetail,
                  pathParameters: {'id': user.id.toString()},
                ),
              );
            },
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
