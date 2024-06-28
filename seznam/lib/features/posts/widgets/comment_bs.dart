import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seznam/core/widgets/custom_button.dart';
import 'package:seznam/features/posts/models/comment_model.dart';
import 'package:seznam/features/posts/providers/comment_provider.dart';

class AddCommentSheet extends StatelessWidget {
  const AddCommentSheet({super.key, required this.postId, required this.ref});

  final int postId;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final nameController = TextEditingController();
    final bodyController = TextEditingController();

    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: bodyController,
            decoration: const InputDecoration(labelText: 'Body'),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton.text(
                onPressed: () {
                  emailController.clear();
                  nameController.clear();
                  bodyController.clear();
                  Navigator.pop(context);
                },
                text: 'Close',
              ),
              CustomButton.contained(
                onPressed: () {
                  final newComment = Comment(
                    id: DateTime.now().millisecondsSinceEpoch,
                    postId: postId,
                    name: nameController.text,
                    email: emailController.text,
                    body: bodyController.text,
                  );
                  ref.read(commentNotifierProvider(postId).notifier).addComment(newComment);
                  emailController.clear();
                  nameController.clear();
                  bodyController.clear();
                  Navigator.pop(context);
                },
                text: 'Add',
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
