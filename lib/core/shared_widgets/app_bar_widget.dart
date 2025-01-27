import 'package:flutter/material.dart';
import 'package:hotel_booking/core/constants/custom_colors.dart';

class AppBarGeneric extends StatelessWidget implements PreferredSizeWidget {
  const AppBarGeneric({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomColors.blue,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
