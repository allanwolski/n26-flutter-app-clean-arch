import 'dart:ui';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  final int currentIndex;
  final int Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 0.0,
            color: Colors.black12,
          ),
        ),
      ),
      child: BottomNavigationBar(
        key: const Key('bottom_navigation_bar'),
        elevation: 5.0,
        currentIndex: currentIndex,
        selectedFontSize: 12.0,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black,
        selectedItemColor: const Color(0xFF2e977f),
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: _buildIcon('assets/icons/home.png'),
            activeIcon: _buildIcon('assets/icons/active_home.png'),
          ),
          BottomNavigationBarItem(
            label: 'Spaces',
            icon: _buildIcon('assets/icons/spaces.png'),
            activeIcon: _buildIcon('assets/icons/active_spaces.png'),
          ),
          BottomNavigationBarItem(
            label: 'Explore',
            icon: _buildIcon('assets/icons/explore.png'),
            activeIcon: _buildIcon('assets/icons/active_explore.png'),
          ),
          BottomNavigationBarItem(
            label: 'Actions',
            icon: _buildIcon('assets/icons/actions.png'),
            activeIcon: _buildIcon('assets/icons/active_actions.png'),
          ),
        ],
        onTap: onTap,
      ),
    );
  }

  Widget _buildIcon(String path) {
    return Container(
      height: 30.0,
      padding: const EdgeInsets.all(2),
      child: Image.asset(path),
    );
  }
}
