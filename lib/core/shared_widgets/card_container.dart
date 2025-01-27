import 'package:flutter/material.dart';

import '../constants/dimens.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({
    super.key,
    required this.child,
    this.isTopRounded = false,
    this.isBottomRounded = false,
    this.margin,
    this.padding,
    this.color = Colors.white,
    this.shadow,
    this.width,
    this.radiusValue,
  });

  final Widget child;
  final bool isTopRounded;
  final bool isBottomRounded;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color color;
  final List<BoxShadow>? shadow;
  final double? width;
  final double? radiusValue;

  @override
  Widget build(BuildContext context) {
    final radiusValue = this.radiusValue ?? Dimens.large;

    return Container(
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        boxShadow: shadow,
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: isTopRounded
              ? Radius.circular(radiusValue)
              : const Radius.circular(0),
          topRight: isTopRounded
              ? Radius.circular(radiusValue)
              : const Radius.circular(0),
          bottomLeft: isBottomRounded
              ? Radius.circular(radiusValue)
              : const Radius.circular(0),
          bottomRight: isBottomRounded
              ? Radius.circular(radiusValue)
              : const Radius.circular(0),
        ),
      ),
      child: child,
    );
  }
}
