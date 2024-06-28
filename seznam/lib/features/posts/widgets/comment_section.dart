import 'package:flutter/material.dart';

class CommentSection extends StatelessWidget {
  const CommentSection({
    super.key,
    required this.name,
    required this.email,
    required this.body,
  });

  final String name;
  final String email;
  final String body;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.person, size: 20),
              const SizedBox(width: 5),
              Text('Name:', style: textTheme.titleMedium),
              const SizedBox(width: 5),
              Expanded(child: Text(name, style: textTheme.bodyMedium)),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.email, size: 20),
              const SizedBox(width: 5),
              Text('Email:', style: textTheme.titleMedium),
              const SizedBox(width: 5),
              Expanded(child: Text(email, style: textTheme.bodyMedium)),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.comment, size: 20),
              const SizedBox(width: 5),
              Text('Body:', style: textTheme.titleMedium),
              const SizedBox(width: 5),
              Expanded(child: Text(body, style: textTheme.bodyMedium)),
            ],
          ),
        ],
      ),
    );
  }
}
