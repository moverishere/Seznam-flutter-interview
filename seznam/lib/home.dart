import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seznam/core/widgets/animated_nav_item.dart';

class HomeScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const HomeScreen({required this.navigationShell, super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
      widget.navigationShell.goBranch(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: widget.navigationShell,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTap,
          items: [
            BottomNavigationBarItem(
              icon: AnimatedNavBarItem(
                icon: Icons.person,
                isSelected: _currentIndex == 0,
              ),
              label: 'Users',
            ),
            BottomNavigationBarItem(
              icon: AnimatedNavBarItem(
                icon: Icons.post_add,
                isSelected: _currentIndex == 1,
              ),
              label: 'Posts',
            ),
          ],
        ),
      ),
    );
  }
}
