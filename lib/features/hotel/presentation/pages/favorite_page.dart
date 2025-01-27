import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/core/constants/dimens.dart';

import '../../../../core/shared_widgets/app_bar_widget.dart';
import '../widgets/item_hotel_widget.dart';

@RoutePage()
class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarGeneric(title: 'Favoriten'),
      backgroundColor: Colors.white,
      body: ListView.builder(
        padding: const EdgeInsets.all(Dimens.large),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container();
        },
      ),
    );
  }
}
