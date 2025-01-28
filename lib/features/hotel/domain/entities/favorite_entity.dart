class FavoriteEntity {
  const FavoriteEntity({
    required this.id,
    required this.images,
    required this.name,
    required this.destination,
    required this.score,
    required this.scoreDescription,
    required this.reviewsCount,
  });

  final String id;
  final List<String> images;
  final String name;
  final String destination;
  final double score;
  final String scoreDescription;
  final int reviewsCount;
}
