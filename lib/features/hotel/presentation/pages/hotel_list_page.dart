import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/core/constants/custom_style.dart';

import '../../../../core/constants/dimens.dart';
import '../../../../core/shared_widgets/app_bar_widget.dart';
import '../widgets/item_hotel_widget.dart';

@RoutePage()
class HotelListPage extends StatelessWidget {
  const HotelListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarGeneric(title: 'Hotels'),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.large,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: Dimens.extraLarge),
            Text(
              '1.620 Hotels für Mallorca',
              style: CustomStyle.subheadline,
            ),
            const SizedBox(height: Dimens.large - 3),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return const ItemHotelWidget(isDetailShown: true);
              },
            )
          ],
        ),
      ),
    );
  }
}
