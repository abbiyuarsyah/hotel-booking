import 'package:flutter/material.dart';

import '../../../../core/constants/custom_style.dart';
import '../../../../core/constants/dimens.dart';

class ItemHotelDetailWidget extends StatelessWidget {
  const ItemHotelDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '8 Tage | 7 Nächte',
              style: CustomStyle.body,
            ),
            Text(
              'Doppelzimmer | Frühstück',
              style: CustomStyle.body,
            ),
            Text(
              '2 Erw., 2 Kinder | inkl. Flug',
              style: CustomStyle.body,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'ab',
                  style: CustomStyle.body,
                ),
                const SizedBox(width: Dimens.small),
                Text(
                  '1.279,00 €',
                  style: CustomStyle.headline,
                ),
              ],
            ),
            Text(
              '319,75 € p.P',
              style: CustomStyle.body,
            ),
          ],
        ),
      ],
    );
  }
}
