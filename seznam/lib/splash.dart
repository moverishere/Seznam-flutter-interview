import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:seznam/core/constants/constants.dart';
import 'package:seznam/routing/route_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  void navigateToHome() async {
    // Simulate initialization
    await Future.delayed(const Duration(seconds: 2));

    // After waiting for 2s, navigate to the home screen
    if (mounted) {
      context.goNamed(RouteConstansts.users);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Constants.logoPath,
          width: 100,
          height: 100,
        )
        .animate(onPlay: (controller) => controller.repeat())
        .scale(
          duration: 500.ms,
          begin: const Offset(1.0, 1.0),
          end: const Offset(1.2, 1.2),
          curve: Curves.easeInOut,
        ).then().scale(
          duration: 500.ms,
          begin: const Offset(1.2, 1.2),
          end: const Offset(1.0, 1.0),
          curve: Curves.easeInOut,
        ),
      ),
    );
  }
}
