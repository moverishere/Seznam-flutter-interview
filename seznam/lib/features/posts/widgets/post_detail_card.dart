import 'package:flutter/material.dart';

class PostDetailsCard extends StatelessWidget {
  const PostDetailsCard({
    super.key,
    required this.title,
    required this.body,
  });

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title:', style: textTheme.titleLarge),
            Text(title, style: textTheme.bodyLarge),
            const SizedBox(height: 16),
            Text('Body:', style: textTheme.titleMedium),
            Text(body, style: textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
