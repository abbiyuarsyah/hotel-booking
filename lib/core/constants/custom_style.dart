import 'package:flutter/material.dart';
import 'package:hotel_booking/core/constants/custom_colors.dart';

class CustomStyle {
  CustomStyle._();

  static TextStyle headline = const TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    color: CustomColors.black,
  );
  static TextStyle subheadline = const TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: CustomColors.black,
  );

  static TextStyle title = const TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: CustomColors.black,
  );

  static TextStyle subtitle = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: CustomColors.grey,
  );

  static TextStyle body = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: CustomColors.grey,
  );
}
