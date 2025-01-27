import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/core/extensions/number_formatter.dart';
import 'package:hotel_booking/features/hotel/domain/entities/hotels_entity.dart';

import '../../../../core/constants/custom_style.dart';
import '../../../../core/constants/dimens.dart';

class ItemHotelDetailWidget extends StatelessWidget {
  const ItemHotelDetailWidget({super.key, required this.bestOfferEntity});

  final BestOfferEntity bestOfferEntity;

  @override
  Widget build(BuildContext context) {
    final flightIncluded =
        bestOfferEntity.flightIncluded ? tr('incl_flight') : '';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2 - Dimens.extraLarge,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: Dimens.medium),
                Text(
                  '${bestOfferEntity.travelDate.days} ${tr('days')} | ${bestOfferEntity.travelDate.nights} ${tr('nights')}',
                  style: CustomStyle.body,
                ),
                Text(
                  maxLines: 2,
                  '${bestOfferEntity.rooms.overall.name} | ${bestOfferEntity.rooms.overall.boarding}',
                  style: CustomStyle.body,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${bestOfferEntity.rooms.overall.adultCount} ${tr('adults')}, ${bestOfferEntity.rooms.overall.childrenCount} ${tr('kids')} | $flightIncluded',
                  style: CustomStyle.body,
                ),
              ],
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  'ab',
                  style: CustomStyle.body,
                ),
                const SizedBox(width: Dimens.small),
                Text(
                  bestOfferEntity.originalTravelPrice.toEuroFormat,
                  style: CustomStyle.headline,
                ),
              ],
            ),
            Text(
              '${bestOfferEntity.simplePricePerPerson.toEuroFormat} p.P',
              style: CustomStyle.body,
            ),
          ],
        ),
      ],
    );
  }
}
