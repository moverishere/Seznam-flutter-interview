import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seznam/features/posts/providers/post_provider.dart';

class PostsTab extends ConsumerWidget {
  const PostsTab({
    super.key,
    required this.userId,
    required this.textTheme,
    required this.themeColors,
  });

  final int userId;
  final TextTheme textTheme;
  final ColorScheme themeColors;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPostsAsyncValue = ref.watch(userPostsProvider(userId));

    return userPostsAsyncValue.when(
      data: (posts) => RefreshIndicator(
        onRefresh: () => ref.refresh(userPostsProvider(userId).future),
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            final isEven = index % 2 == 0;
            return Container(
              color: isEven ? themeColors.secondaryContainer : Colors.transparent,
              child: ListTile(
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text('ID:', style: textTheme.titleMedium),
                        const SizedBox(width: 5),
                        Text(post.id.toString(), style: textTheme.bodyMedium),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text('Title:', style: textTheme.titleMedium),
                        const SizedBox(width: 5),
                        Text(post.title, style: textTheme.bodyMedium),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text('Body:', style: textTheme.titleMedium),
                        const SizedBox(width: 5),
                        Text(post.body, style: textTheme.bodyMedium),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }
}
