import 'package:flutter/material.dart';
import 'package:tien_am/core/ui/styles/styles.dart';
import 'package:tien_am/core/ui/widget/widget.dart';

class BooksCarousel extends StatefulWidget {
  const BooksCarousel({super.key});

  @override
  State<BooksCarousel> createState() => _BooksCarouselState();
}

class _BooksCarouselState extends State<BooksCarousel> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: .65,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      height: MediaQuery.sizeOf(context).height * .45,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          if (_pageController.position.haveDimensions == false) {
            return const SizedBox.shrink();
          }
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double value = 1.0;
              if (_pageController.position.haveDimensions) {
                value = _pageController.page! - index;
                value = (1 - (value.abs() * 0.2)).clamp(
                  0.0,
                  1.0,
                );
              }
              return _BookItem(
                scale: value,
                focused: index == _pageController.page?.round(),
              );
            },
          );
        },
      ),
    );
  }
}

class _BookItem extends StatefulWidget {
  final double scale;
  final bool focused;

  const _BookItem({
    super.key,
    required this.scale,
    required this.focused,
  });

  @override
  State<_BookItem> createState() => _BookItemState();
}

class _BookItemState extends State<_BookItem> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 200,
      ),
    );
    _scaleAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    if (widget.focused) {
      _animationController.forward();
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant _BookItem oldWidget) {
    if (widget.focused) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: widget.scale,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: AnimatedBuilder(
                  animation: _scaleAnimation,
                  builder: (context, child) {
                    double borderRadiusValue = _scaleAnimation.value < 0.5
                        ? 10.0
                        : 10.0 * (1 - _scaleAnimation.value);

                    return Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: const Radius.circular(10),
                          bottom: Radius.circular(borderRadiusValue),
                        ),
                      ),
                      child: child,
                    );
                  },
                  child: Image.network(
                    'https://picsum.photos/300/350',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              SizeTransition(
                sizeFactor: _scaleAnimation,
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 8,
                  ),
                  decoration: const BoxDecoration(
                    color: AppColors.lightPink,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(
                        10,
                      ),
                    ),
                  ),
                  child: AppText.base(
                    'Hello world',
                    textColor: AppColors.black,
                  ),
                ),
              )
            ],
          ),
          Positioned(
            bottom: 9,
            right: 10,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: AppIconButton(
                gradient: AppColors.orangeGradient,
                onPressed: () {},
                iconColor: AppColors.white,
                icon: const Icon(
                  Icons.play_arrow_rounded,
                  size: 25,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
