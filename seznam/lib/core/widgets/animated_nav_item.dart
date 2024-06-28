import 'package:flutter/material.dart';

class AnimatedNavBarItem extends StatefulWidget {
  
  const AnimatedNavBarItem({
    super.key,
    required this.icon,
    required this.isSelected,
  });

  final IconData icon;
  final bool isSelected;


  @override
  AnimatedNavBarItemState createState() => AnimatedNavBarItemState();
}

class AnimatedNavBarItemState extends State<AnimatedNavBarItem>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _shakeController;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void didUpdateWidget(covariant AnimatedNavBarItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected) {
      _scaleController.forward();
      _shakeController.forward(from: 0.0);
    } else {
      _scaleController.reverse();
    }
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _shakeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShakeTransition(
      controller: _shakeController,
      child: ScaleTransition(
        scale: Tween<double>(begin: 1.0, end: 1.2).animate(
          CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
        ),
        child: Icon(widget.icon),
      ),
    );
  }
}

class ShakeTransition extends StatelessWidget {
  final AnimationController controller;
  final Widget child;

  const ShakeTransition({super.key, required this.controller, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double offset = 4.0 * (controller.value - 0.5).abs();
        return Transform.translate(
          offset: Offset(offset, 0),
          child: child,
        );
      },
      child: child,
    );
  }
}
