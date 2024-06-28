// post_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seznam/core/widgets/custom_appbar.dart';
import 'package:seznam/features/posts/providers/post_provider.dart';
import 'package:seznam/routing/route_constants.dart';

class PostScreen extends ConsumerWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsyncValue = ref.watch(postsProvider);
    final textTheme = Theme.of(context).textTheme;
    final themeColors = Theme.of(context).colorScheme;
    

    return CustomScaffold(
      title: 'Posts',
      body: postsAsyncValue.when(
        data: (posts) => RefreshIndicator(
          onRefresh: () => ref.refresh(postsProvider.future),
          child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              final isEven = index % 2 == 0;
              return ListTile(
                  title: Text(post.title, style: textTheme.titleMedium),
                  tileColor: isEven ? themeColors.surfaceContainer : null, 
                  subtitle: Text(post.body, style: textTheme.bodyMedium),
                  onTap: () => context.goNamed(
                    RouteConstansts.postDetail,
                    pathParameters: {'id': post.id.toString()},
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
