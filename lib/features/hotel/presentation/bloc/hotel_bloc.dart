import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/core/enums/state_status.dart';
import 'package:hotel_booking/features/hotel/domain/entities/favorite_entity.dart';
import 'package:hotel_booking/features/hotel/domain/entities/hotels_entity.dart';
import 'package:hotel_booking/features/hotel/domain/use_case/delete_favorite.dart';
import 'package:hotel_booking/features/hotel/domain/use_case/get_favorites.dart';
import 'package:hotel_booking/features/hotel/domain/use_case/get_hotels.dart';
import 'package:hotel_booking/features/hotel/presentation/bloc/hotel_event.dart';
import 'package:hotel_booking/features/hotel/presentation/bloc/hotel_state.dart';
import 'dart:math' as math;

import '../../domain/use_case/add_to_favorite.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  HotelBloc({
    required this.getHotels,
    required this.getFavorites,
    required this.deleteFavorite,
    required this.addToFavorite,
  }) : super(
          HotelState(
            getHotelsStatus: StateStatus.init,
            deleteFavoriteStatus: StateStatus.init,
            addToFavoriteStatus: StateStatus.init,
            getFavoritesStatus: StateStatus.init,
            hotelsEntity: HotelsEntity(
              hotels: [],
              hotelCount: 0,
            ),
            errorMessage: '',
            favorites: const [],
          ),
        ) {
    on<GetHotelsEvent>(_onGetHotelsEvent);
    on<GetFavoriteEvent>(_onGetFavoritesEvent);
    on<DeleteFavoriteEvent>(_onDeleteFavoriteEvent);
    on<AddToFavoriteEvent>(_onAddToFavoriteEvent);
  }

  final GetHotels getHotels;
  final GetFavorites getFavorites;
  final DeleteFavorite deleteFavorite;
  final AddToFavorite addToFavorite;

  Future<void> _onGetHotelsEvent(
    GetHotelsEvent event,
    Emitter<HotelState> emit,
  ) async {
    emit(state.copyWith(getHotelsStatus: StateStatus.loading));

    final result = await getHotels(null);
    result.fold((l) {
      emit(state.copyWith(
        getHotelsStatus: StateStatus.failed,
        errorMessage: l.message,
      ));
    }, (r) {
      emit(state.copyWith(
        getHotelsStatus: StateStatus.loaded,
        hotelsEntity: r,
      ));
    });
  }

  Future<void> _onGetFavoritesEvent(
    GetFavoriteEvent event,
    Emitter<HotelState> emit,
  ) async {
    emit(state.copyWith(getFavoritesStatus: StateStatus.loading));

    final result = await getFavorites(null);
    result.fold((l) {
      emit(state.copyWith(
        getFavoritesStatus: StateStatus.failed,
        errorMessage: l.message,
      ));
    }, (r) {
      if (r.isEmpty) {
        emit(state.copyWith(getFavoritesStatus: StateStatus.emtpy));
      } else {
        emit(state.copyWith(
          getFavoritesStatus: StateStatus.loaded,
          favorites: r,
        ));
      }
    });
  }

  Future<void> _onAddToFavoriteEvent(
    AddToFavoriteEvent event,
    Emitter<HotelState> emit,
  ) async {
    emit(state.copyWith(addToFavoriteStatus: StateStatus.loading));

    final result = await addToFavorite(FavoriteEntity(
      id: math.Random().nextInt(100),
      images: event.entity.images.map((e) => e.large).toList(),
      name: event.entity.name,
      destination: event.entity.destination,
      score: event.entity.rating.score,
      scoreDescription: event.entity.rating.scoreDescription,
      reviewsCount: event.entity.rating.reviewsCount,
    ));

    result.fold((l) {
      emit(state.copyWith(addToFavoriteStatus: StateStatus.failed));
    }, (r) {
      emit(state.copyWith(addToFavoriteStatus: StateStatus.loaded));
    });
  }

  Future<void> _onDeleteFavoriteEvent(
    DeleteFavoriteEvent event,
    Emitter<HotelState> emit,
  ) async {
    emit(state.copyWith(deleteFavoriteStatus: StateStatus.loading));

    final result = await deleteFavorite(event.entity);
    result.fold((l) {
      emit(state.copyWith(deleteFavoriteStatus: StateStatus.failed));
    }, (r) {
      emit(state.copyWith(deleteFavoriteStatus: StateStatus.loaded));
    });
  }
}
