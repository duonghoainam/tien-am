import 'package:flutter/material.dart';

class AppScaleWidget extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;

  const AppScaleWidget({
    super.key,
    required this.child,
    required this.onTap,
  });

  @override
  _InteractiveScaleWidgetState createState() => _InteractiveScaleWidgetState();
}

class _InteractiveScaleWidgetState extends State<AppScaleWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 200,
      ),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    _animationController.forward(); // Bắt đầu scale nhỏ lại khi nhấn
  }

  void _handleTapUp(TapUpDetails details) {
    _animationController.reverse(); // Trở về kích thước bình thường khi thả
  }

  void _handleHover(bool isHovered) {
    if (isHovered) {
      _animationController.forward(); // Bắt đầu scale nhỏ lại khi hover
    } else {
      _animationController
          .reverse(); // Trở về kích thước bình thường khi rời khỏi hover
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: GestureDetector(
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTap: widget.onTap,
        onTapCancel: () => _animationController.reverse(),
        child: ScaleTransition(
          scale: _scaleAnimation, // Hiệu ứng scale
          child: widget.child,
        ),
      ),
    );
  }
}
