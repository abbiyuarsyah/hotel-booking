import 'package:equatable/equatable.dart';
import 'package:hotel_booking/features/hotel/domain/entities/favorite_entity.dart';
import 'package:hotel_booking/features/hotel/domain/entities/hotels_entity.dart';

import '../../../../core/enums/state_status.dart';

class HotelState extends Equatable {
  const HotelState({
    required this.hotelsEntity,
    required this.getHotelsStatus,
    required this.deleteFavoriteStatus,
    required this.addToFavoriteStatus,
    required this.getFavoritesStatus,
    required this.errorMessage,
    required this.favorites,
    required this.addToFavoriteFlag,
    required this.favoritesHolder,
  });

  final HotelsEntity hotelsEntity;
  final StateStatus getHotelsStatus;
  final StateStatus deleteFavoriteStatus;
  final StateStatus addToFavoriteStatus;
  final StateStatus getFavoritesStatus;
  final String errorMessage;
  final List<FavoriteEntity> favorites;
  final bool addToFavoriteFlag;
  final List<String> favoritesHolder;

  HotelState copyWith({
    StateStatus? getHotelsStatus,
    StateStatus? deleteFavoriteStatus,
    StateStatus? addToFavoriteStatus,
    StateStatus? getFavoritesStatus,
    HotelsEntity? hotelsEntity,
    String? errorMessage,
    List<FavoriteEntity>? favorites,
    bool? addToFavoriteFlag,
    List<String>? favoritesHolder,
  }) {
    return HotelState(
      getHotelsStatus: getHotelsStatus ?? this.getHotelsStatus,
      deleteFavoriteStatus: deleteFavoriteStatus ?? this.deleteFavoriteStatus,
      addToFavoriteStatus: addToFavoriteStatus ?? this.addToFavoriteStatus,
      getFavoritesStatus: getFavoritesStatus ?? this.getFavoritesStatus,
      hotelsEntity: hotelsEntity ?? this.hotelsEntity,
      errorMessage: errorMessage ?? this.errorMessage,
      favorites: favorites ?? this.favorites,
      addToFavoriteFlag: addToFavoriteFlag ?? this.addToFavoriteFlag,
      favoritesHolder: favoritesHolder ?? this.favoritesHolder,
    );
  }

  @override
  List<Object> get props => [
        hotelsEntity,
        getHotelsStatus,
        deleteFavoriteStatus,
        addToFavoriteStatus,
        getFavoritesStatus,
        errorMessage,
        favorites,
        addToFavoriteFlag,
        favoritesHolder,
      ];
}
