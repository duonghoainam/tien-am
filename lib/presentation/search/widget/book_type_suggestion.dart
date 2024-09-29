import 'package:flutter/material.dart';
import 'package:tien_am/core/ui/styles/styles.dart';
import 'package:tien_am/core/ui/widget/widget.dart';

class BookTypeSuggestion extends StatelessWidget {
  final String title;
  final String? imageUrl;

  const BookTypeSuggestion({
    super.key,
    required this.title,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: AppColors.purple,
        // image: DecorationImage(
        //   image: NetworkImage(
        //     imageUrl ?? 'https://picsum.photos/300/350',
        //   ),
        //   fit: BoxFit.cover,
        // ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
      ),
      alignment: const Alignment(
        -.5,
        -.7,
      ),
      child: AppText.medium(
        title,
        textColor: AppColors.white,
      ),
    );
  }
}
