import 'package:dartz/dartz.dart';
import 'package:hotel_booking/features/hotel/data/models/favorite_model.dart';

import '../../../../core/utils/execptions.dart';
import '../../data/models/hotels_model.dart';

abstract class HotelRepository {
  Future<Either<Failure, HotelsModel>> getHotels();
  Future<Either<Failure, List<FavoriteModel>>> getFavorites();
  Future<Either<Failure, bool>> deleteFavorite(FavoriteModel model);
  Future<Either<Failure, bool>> addToFavorite(FavoriteModel model);
}
