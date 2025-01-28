import 'package:dartz/dartz.dart';

import 'package:hotel_booking/core/utils/execptions.dart';
import 'package:hotel_booking/features/hotel/data/datasources/hotel_local_datasource.dart';
import 'package:hotel_booking/features/hotel/data/datasources/hotel_remote_datasource.dart';
import 'package:hotel_booking/features/hotel/data/models/favorite_model.dart';

import 'package:hotel_booking/features/hotel/data/models/hotels_model.dart';

import '../../../../core/utils/network_info.dart';
import '../../domain/repositories/hotel_repsitory.dart';

class HotelRepositoryImpl implements HotelRepository {
  const HotelRepositoryImpl({
    required this.networkInfo,
    required this.datasource,
    required this.localDatasource,
  });

  final NetworkInfo networkInfo;
  final HotelRemoteDatasource datasource;
  final HotelLocalDatasource localDatasource;

  @override
  Future<Either<Failure, HotelsModel>> getHotels() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await datasource.getHotels();

        return result.fold((l) {
          return Left(l);
        }, (r) {
          return Right(r);
        });
      } catch (_) {
        return Left(UnexpectedFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteFavorite(FavoriteModel model) async {
    try {
      final result = await localDatasource.deleteFavorite(model);
      return Right(result);
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, List<FavoriteModel>>> getFavorites() async {
    try {
      final result = await localDatasource.getFavorites();
      return Right(result);
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> addToFavorite(FavoriteModel model) async {
    try {
      final result = await localDatasource.addToFavorite(model);
      return Right(result);
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }
}
