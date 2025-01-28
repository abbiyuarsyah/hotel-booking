import 'package:dartz/dartz.dart';
import 'package:hotel_booking/features/hotel/data/models/favorite_model.dart';

import '../../../../core/utils/execptions.dart';
import '../../../../core/utils/use_case.dart';
import '../entities/favorite_entity.dart';
import '../repositories/hotel_repsitory.dart';

class DeleteFavorite extends UseCase<bool, FavoriteEntity> {
  DeleteFavorite({required this.repository});

  final HotelRepository repository;

  @override
  Future<Either<Failure, bool>> call(
    FavoriteEntity params,
  ) async {
    final result = await repository.deleteFavorite(FavoriteModel(
      id: params.id,
      images: params.images,
      name: params.name,
      destination: params.destination,
      score: params.score,
      scoreDescription: params.scoreDescription,
      reviewsCount: params.reviewsCount,
    ));

    return result.fold((l) => Left(l), (r) => Right(r));
  }
}
