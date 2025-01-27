import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/features/hotel/domain/entities/hotels_entity.dart';
import 'package:hotel_booking/features/hotel/presentation/widgets/category_widget.dart';
import 'package:hotel_booking/features/hotel/presentation/widgets/item_hotel_detail_widget.dart';

import '../../../../core/constants/custom_colors.dart';
import '../../../../core/constants/custom_style.dart';
import '../../../../core/constants/dimens.dart';
import '../../../../core/shared_widgets/card_container.dart';

class ItemHotelWidget extends StatelessWidget {
  const ItemHotelWidget({
    super.key,
    required this.isDetailShown,
    required this.hotel,
  });

  final bool isDetailShown;
  final HotelEntity hotel;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      shadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          spreadRadius: 0,
          blurRadius: 24,
        ),
      ],
      margin: const EdgeInsets.only(bottom: Dimens.large),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                ),
                items: hotel.images.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(Dimens.medium),
                            topRight: Radius.circular(Dimens.medium)),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: double.infinity,
                          child: Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(i.small),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              isDetailShown
                  ? const SizedBox()
                  : Positioned(
                      bottom: Dimens.large,
                      left: Dimens.medium,
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
                                const Icon(Icons.rounded_corner),
                                const SizedBox(width: 8),
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.large),
            child: Row(
              children: [
                CategoryWidget(
                  category: 4,
                ),
                SizedBox(width: Dimens.small),
                SizedBox(
                  child: Icon(
                    Icons.help_outline,
                    color: CustomColors.grey,
                    size: 16,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: Dimens.small),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.large),
            child: Text(
              hotel.name,
              style: CustomStyle.title,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.large),
            child: Text(
              hotel.destination,
              style: CustomStyle.subtitle,
            ),
          ),
          const SizedBox(height: Dimens.medium),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.large),
            child: Divider(),
          ),
          isDetailShown
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimens.large),
                  child: ItemHotelDetailWidget(
                    bestOfferEntity: hotel.bestOffer,
                  ),
                )
              : const SizedBox(),
          const SizedBox(height: Dimens.medium),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.large)
                .copyWith(bottom: Dimens.large),
            child: SizedBox(
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
                child: Text(
                  tr('to_the_offers'),
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
