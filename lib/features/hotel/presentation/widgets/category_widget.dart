import 'package:flutter/material.dart';
import 'package:hotel_booking/core/constants/custom_colors.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.category});

  final int category;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(category, (index) {
        return const Icon(
          Icons.star,
          color: CustomColors.black,
          size: 16,
        );
      }),
    );
  }
}
