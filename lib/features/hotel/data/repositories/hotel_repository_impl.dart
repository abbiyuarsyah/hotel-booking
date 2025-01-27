import 'package:dartz/dartz.dart';

import 'package:hotel_booking/core/utils/execptions.dart';
import 'package:hotel_booking/features/hotel/data/datasources/hotel_remote_datasource.dart';

import 'package:hotel_booking/features/hotel/data/models/hotels_model.dart';

import '../../../../core/utils/network_info.dart';
import '../../domain/repositories/hotel_repsitory.dart';

class HotelRepositoryImpl implements HotelRepository {
  const HotelRepositoryImpl({
    required this.networkInfo,
    required this.datasource,
  });

  final NetworkInfo networkInfo;
  final HotelRemoteDatasource datasource;
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
}
