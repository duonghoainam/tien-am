import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tien_am/core/ui/styles/styles.dart';

class AppNavBar extends StatefulWidget {
  final List<BottomNavigationBarItem> items;
  final ValueChanged<int> onTap;
  final int currentIndex;

  const AppNavBar({
    super.key,
    required this.items,
    required this.onTap,
    required this.currentIndex,
  });

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  List<BottomNavigationBarItem> get items => widget.items;

  bool isActive(int index) {
    return index == widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Colors.white.withOpacity(
          0.95,
        ),

      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10,
          sigmaY: 10,
        ),
        child: BottomNavigationBar(
          elevation: 0,
          onTap: widget.onTap,
          type: BottomNavigationBarType.fixed,
          currentIndex: widget.currentIndex,
          backgroundColor: Colors.transparent,
          iconSize: 20,
          items: items,
          selectedItemColor: AppColors.orange,
        ),
      ),
    );
  }
}
