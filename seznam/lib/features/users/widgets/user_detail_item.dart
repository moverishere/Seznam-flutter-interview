import 'package:flutter/material.dart';

class DetailItem extends StatelessWidget {
  const DetailItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.textTheme,
  });

  final IconData icon;
  final String label;
  final String value;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 5),
        Text(label, style: textTheme.titleMedium),
        const SizedBox(width: 5),
        Text(value, style: textTheme.bodyMedium),
      ],
    );
  }
}
