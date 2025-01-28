import 'package:hotel_booking/features/hotel/domain/entities/favorite_entity.dart';
import 'package:hotel_booking/features/hotel/domain/entities/hotels_entity.dart';

abstract class HotelEvent {
  const HotelEvent();
}

class GetHotelsEvent extends HotelEvent {
  const GetHotelsEvent();
}

class AddToFavoriteEvent extends HotelEvent {
  const AddToFavoriteEvent({required this.entity});

  final HotelEntity entity;
}

class DeleteFavoriteEvent extends HotelEvent {
  const DeleteFavoriteEvent({required this.entity});

  final FavoriteEntity entity;
}

class GetFavoriteEvent extends HotelEvent {
  const GetFavoriteEvent();
}
