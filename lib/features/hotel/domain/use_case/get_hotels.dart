import 'package:dartz/dartz.dart';
import 'package:hotel_booking/core/utils/execptions.dart';
import 'package:hotel_booking/core/utils/use_case.dart';
import 'package:hotel_booking/features/hotel/domain/entities/hotels_entity.dart';
import 'package:hotel_booking/features/hotel/domain/repositories/hotel_repsitory.dart';

class GetHotels extends UseCase<HotelsEntity, Object?> {
  GetHotels({required this.repository});

  final HotelRepository repository;

  @override
  Future<Either<Failure, HotelsEntity>> call(Object? params) async {
    final result = await repository.getHotels();

    return result.fold(
      (l) => Left(l),
      (r) => Right(
        HotelsEntity(
          hotels: (r.hotels ?? [])
              .map(
                (e) => HotelEntity(
                  bestOffer: BestOfferEntity(
                    originalTravelPrice: e.bestOffer?.originalTravelPrice ?? 0,
                    simplePricePerPerson:
                        e.bestOffer?.simplePricePerPerson ?? 0,
                    rooms: RoomEntity(
                      overall: RoomOverallEntity(
                        boarding: e.bestOffer?.rooms?.overall?.boarding ?? '',
                        name: e.bestOffer?.rooms?.overall?.name ?? '',
                        adultCount:
                            e.bestOffer?.rooms?.overall?.adultCount ?? 0,
                        childrenCount:
                            e.bestOffer?.rooms?.overall?.childrenCount ?? 0,
                      ),
                    ),
                    travelDate: TravelDateEntity(
                      days: e.bestOffer?.travelDate?.days ?? 0,
                      nights: e.bestOffer?.travelDate?.nights ?? 0,
                    ),
                    flightIncluded: e.bestOffer?.flightIncluded ?? false,
                  ),
                  category: e.category ?? 0,
                  destination: e.destination ?? '',
                  images: (e.images ?? [])
                      .map(
                        (e) => ImageEntity(
                          large: e.large ?? '',
                          small: e.small ?? '',
                        ),
                      )
                      .toList(),
                  name: e.name ?? '',
                  rating: RatingInfoEntity(
                    reviewsCount: e.ratingInfo?.reviewsCount ?? 0,
                    score: e.ratingInfo?.score ?? 0,
                    scoreDescription: e.ratingInfo?.scoreDescription ?? '',
                  ),
                ),
              )
              .toList(),
          hotelCount: r.hotelCount ?? 0,
        ),
      ),
    );
  }
}
