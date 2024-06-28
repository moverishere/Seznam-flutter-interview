import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton._({
    required this.onPressed,
    required this.text,
    required this.icon,
    required this.style,
    required this.buttonType,
  });

  final VoidCallback? onPressed;
  final String text;
  final IconData? icon;
  final ButtonStyle style;
  final ButtonType buttonType;

  factory CustomButton.outlined({
    required VoidCallback? onPressed,
    required String text,
    IconData? icon,
  }) {
    return CustomButton._(
      onPressed: onPressed,
      text: text,
      icon: icon,
      style: OutlinedButton.styleFrom(),
      buttonType: ButtonType.outlined,
    );
  }

  factory CustomButton.contained({
    required VoidCallback? onPressed,
    required String text,
    IconData? icon,
  }) {
    return CustomButton._(
      onPressed: onPressed,
      text: text,
      icon: icon,
      style: ElevatedButton.styleFrom(),
      buttonType: ButtonType.contained,
    );
  }

  factory CustomButton.text({
    required VoidCallback? onPressed,
    required String text,
    IconData? icon,
  }) {
    return CustomButton._(
      onPressed: onPressed,
      text: text,
      icon: icon,
      style: TextButton.styleFrom(),
      buttonType: ButtonType.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget buttonChild = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) Icon(icon),
        if (icon != null) const SizedBox(width: 8),
        Text(text),
      ],
    );

    switch (buttonType) {
      case ButtonType.outlined:
        return OutlinedButton(
          onPressed: onPressed,
          style: style,
          child: buttonChild,
        );
      case ButtonType.contained:
        return ElevatedButton(
          onPressed: onPressed,
          style: style,
          child: buttonChild,
        );
      case ButtonType.text:
        return TextButton(
          onPressed: onPressed,
          style: style,
          child: buttonChild,
        );
    }
  }
}

enum ButtonType { outlined, contained, text }
