import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'favorite_model.g.dart';

@HiveType(typeId: 1)
class FavoriteModel extends Equatable {
  const FavoriteModel({
    required this.id,
    required this.images,
    required this.name,
    required this.destination,
    required this.score,
    required this.scoreDescription,
    required this.reviewsCount,
  });

  static const String boxName = 'FavoriteModel';

  @HiveField(0)
  final int id;
  @HiveField(1)
  final List<String> images;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String destination;
  @HiveField(4)
  final double score;
  @HiveField(5)
  final String scoreDescription;
  @HiveField(6)
  final int reviewsCount;

  factory FavoriteModel.empty() {
    return const FavoriteModel(
      id: -1,
      images: [],
      name: '',
      destination: '',
      score: 0.0,
      scoreDescription: '',
      reviewsCount: 0,
    );
  }

  @override
  List<Object> get props => [
        id,
        images,
        name,
        destination,
        score,
        scoreDescription,
        reviewsCount,
      ];
}
