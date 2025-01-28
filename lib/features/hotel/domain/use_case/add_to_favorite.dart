import 'package:dartz/dartz.dart';

import '../../../../core/utils/execptions.dart';
import '../../../../core/utils/use_case.dart';
import '../../data/models/favorite_model.dart';
import '../entities/favorite_entity.dart';
import '../repositories/hotel_repsitory.dart';

class AddToFavorite extends UseCase<bool, FavoriteEntity> {
  AddToFavorite({required this.repository});

  final HotelRepository repository;

  @override
  Future<Either<Failure, bool>> call(
    FavoriteEntity params,
  ) async {
    final result = await repository.addToFavorite(FavoriteModel(
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
