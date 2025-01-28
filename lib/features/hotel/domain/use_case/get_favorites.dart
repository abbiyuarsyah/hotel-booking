import 'package:dartz/dartz.dart';
import 'package:hotel_booking/core/utils/execptions.dart';
import 'package:hotel_booking/core/utils/use_case.dart';
import 'package:hotel_booking/features/hotel/domain/entities/favorite_entity.dart';

import '../repositories/hotel_repsitory.dart';

class GetFavorites extends UseCase<List<FavoriteEntity>, Object?> {
  GetFavorites({required this.repository});

  final HotelRepository repository;

  @override
  Future<Either<Failure, List<FavoriteEntity>>> call(Object? params) async {
    final result = await repository.getFavorites();
    return result.fold(
      (l) => Left(l),
      (r) => Right(
        r
            .map(
              (e) => FavoriteEntity(
                id: e.id,
                images: e.images,
                name: e.name,
                destination: e.destination,
                score: e.score,
                scoreDescription: e.scoreDescription,
                reviewsCount: e.reviewsCount,
              ),
            )
            .toList(),
      ),
    );
  }
}
