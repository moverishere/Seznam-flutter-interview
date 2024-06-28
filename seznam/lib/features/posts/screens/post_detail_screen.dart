import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seznam/core/widgets/custom_appbar.dart';
import 'package:seznam/core/widgets/custom_button.dart';
import 'package:seznam/features/posts/providers/comment_provider.dart';
import 'package:seznam/features/posts/widgets/comment_bs.dart';
import 'package:seznam/features/posts/widgets/comment_section.dart';
import 'package:seznam/features/posts/widgets/post_detail_card.dart';
import 'package:seznam/features/posts/providers/post_provider.dart';

class PostDetailScreen extends ConsumerWidget {
  const PostDetailScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postAsyncValue = ref.watch(postProvider(id));
    final comments = ref.watch(commentNotifierProvider(id));
    final textTheme = Theme.of(context).textTheme;

    return CustomScaffold(
      title: 'Post Detail',
      showBackButton: true,
      body: postAsyncValue.when(
        data: (post) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: PostDetailsCard(
                title: post.title,
                body: post.body,
              ),
            ),
            Text('Comments:', style: textTheme.titleMedium),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  final comment = comments[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommentSection(
                        name: comment.name,
                        email: comment.email,
                        body: comment.body,
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButton.contained(
                onPressed: () => _showAddCommentSheet(context, id, ref),
                text: 'Add Comment',
              ),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }

  void _showAddCommentSheet(BuildContext context, int postId, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      isScrollControlled: true,
      builder: (context) => AddCommentSheet(postId: postId, ref: ref),
    );
  }
}
