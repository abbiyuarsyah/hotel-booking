import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/features/hotel/domain/entities/favorite_entity.dart';
import 'package:hotel_booking/features/hotel/domain/entities/hotels_entity.dart';
import 'package:hotel_booking/features/hotel/presentation/bloc/hotel_event.dart';
import 'package:hotel_booking/features/hotel/presentation/bloc/hotel_state.dart';
import 'package:hotel_booking/features/hotel/presentation/widgets/category_widget.dart';
import 'package:hotel_booking/features/hotel/presentation/widgets/item_hotel_detail_widget.dart';

import '../../../../core/constants/custom_colors.dart';
import '../../../../core/constants/custom_style.dart';
import '../../../../core/constants/dimens.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/shared_widgets/card_container.dart';
import '../bloc/hotel_bloc.dart';

class ItemHotelWidget extends StatelessWidget {
  const ItemHotelWidget({super.key, required this.hotel});

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
                          topRight: Radius.circular(Dimens.medium),
                        ),
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
              BlocBuilder<HotelBloc, HotelState>(
                buildWhen: (previous, current) =>
                    previous.addToFavoriteStatus !=
                        current.addToFavoriteStatus ||
                    previous.addToFavoriteFlag != current.addToFavoriteFlag,
                builder: (context, state) {
                  final isAddedToFavorite = hotel.isAddedToFavorite
                      ? true
                      : state.favoritesHolder.contains(hotel.hotelId);
                  return Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        if (isAddedToFavorite) {
                          sl<HotelBloc>().add(
                            DeleteFavoriteEvent(
                              entity: FavoriteEntity(
                                id: hotel.hotelId,
                                images:
                                    hotel.images.map((e) => e.large).toList(),
                                name: hotel.name,
                                destination: hotel.destination,
                                score: hotel.rating.score,
                                scoreDescription: hotel.rating.scoreDescription,
                                reviewsCount: hotel.rating.reviewsCount,
                              ),
                            ),
                          );
                        } else {
                          if (isAddedToFavorite) {
                            sl<HotelBloc>().add(
                              DeleteFavoriteEvent(
                                entity: FavoriteEntity(
                                  id: hotel.hotelId,
                                  images:
                                      hotel.images.map((e) => e.large).toList(),
                                  name: hotel.name,
                                  destination: hotel.destination,
                                  score: hotel.rating.score,
                                  scoreDescription:
                                      hotel.rating.scoreDescription,
                                  reviewsCount: hotel.rating.reviewsCount,
                                ),
                              ),
                            );
                          } else {
                            sl<HotelBloc>().add(AddToFavoriteEvent(
                              entity: hotel,
                            ));
                          }
                        }
                      },
                      icon: Icon(
                        isAddedToFavorite
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              )
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.large),
            child: ItemHotelDetailWidget(
              bestOfferEntity: hotel.bestOffer,
            ),
          ),
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
                  style: CustomStyle.subtitle.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
