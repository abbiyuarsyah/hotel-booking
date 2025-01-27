import 'package:flutter/material.dart';
import 'package:hotel_booking/features/hotel/presentation/widgets/item_hotel_detail_widget.dart';

import '../../../../core/constants/custom_colors.dart';
import '../../../../core/constants/custom_style.dart';
import '../../../../core/constants/dimens.dart';
import '../../../../core/shared_widgets/card_container.dart';

class ItemHotelWidget extends StatelessWidget {
  const ItemHotelWidget({super.key, required this.isDetailShown});

  final bool isDetailShown;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      margin: const EdgeInsets.only(bottom: Dimens.large),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                color: Colors.grey,
              ),
              Positioned(
                bottom: Dimens.large, // Adjust distance from bottom
                left: Dimens.medium, // Adjust distance from left
                child: Row(
                  children: [
                    CardContainer(
                      padding: const EdgeInsets.all(Dimens.small),
                      isTopRounded: true,
                      isBottomRounded: true,
                      radiusValue: Dimens.extraSmall,
                      color: Colors.green,
                      child: Row(
                        children: [
                          Icon(Icons.rounded_corner),
                          SizedBox(width: 8),
                          Text(
                            '4.1 / 50',
                            style: CustomStyle.body.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: Dimens.medium),
                    Text(
                      'Sehr gut (493 Bew.)',
                      style: CustomStyle.body.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              isDetailShown
                  ? const SizedBox()
                  : Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                      ),
                    ),
            ],
          ),
          const SizedBox(height: Dimens.large),
          const Row(
            children: [
              SizedBox(
                width: 80,
              ),
              SizedBox(
                child: Icon(
                  Icons.help_outline,
                  color: CustomColors.grey,
                ),
              )
            ],
          ),
          const SizedBox(height: Dimens.small),
          Text(
            'Hotel AluaVillage Blue Beach',
            style: CustomStyle.title,
          ),
          Text(
            'Playa de Esquinzo, Fuerteventura, Spanien',
            style: CustomStyle.subtitle,
          ),
          const SizedBox(height: Dimens.medium),
          const Divider(),
          isDetailShown ? const ItemHotelDetailWidget() : const SizedBox(),
          const SizedBox(height: Dimens.medium),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    Dimens.medium,
                  ),
                ),
              ),
              child: const Text(
                'Test',
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
