import 'package:json_annotation/json_annotation.dart';

part 'hotels_model.g.dart';

@JsonSerializable()
class HotelsModel {
  HotelsModel(this.hotels, this.hotelCount);

  final List<HotelModel>? hotels;
  @JsonKey(name: "hotel-count")
  final int? hotelCount;

  factory HotelsModel.fromJson(Map<String, dynamic> json) =>
      _$HotelsModelFromJson(json);

  Map<String, dynamic> toJson() => _$HotelsModelToJson(this);
}

@JsonSerializable()
class HotelModel {
  HotelModel(
    this.bestOffer,
    this.category,
    this.destination,
    this.images,
    this.name,
    this.ratingInfo,
  );

  @JsonKey(name: "best-offer")
  final BestOfferModel? bestOffer;
  final int? category;
  final String? destination;
  final List<ImageModel>? images;
  final String? name;
  @JsonKey(name: "rating-info")
  final RatingInfoModel? ratingInfo;

  factory HotelModel.fromJson(Map<String, dynamic> json) =>
      _$HotelModelFromJson(json);

  Map<String, dynamic> toJson() => _$HotelModelToJson(this);
}

@JsonSerializable()
class BestOfferModel {
  BestOfferModel(
    this.originalTravelPrice,
    this.simplePricePerPerson,
    this.rooms,
    this.travelDate,
    this.flightIncluded,
  );

  @JsonKey(name: "original-travel-price")
  final double? originalTravelPrice;
  @JsonKey(name: "simple-price-per-person")
  final double? simplePricePerPerson;
  final RoomModel? rooms;
  @JsonKey(name: "travel-date")
  final TravelDateModel? travelDate;
  @JsonKey(name: "flight-included")
  final bool? flightIncluded;

  factory BestOfferModel.fromJson(Map<String, dynamic> json) =>
      _$BestOfferModelFromJson(json);

  Map<String, dynamic> toJson() => _$BestOfferModelToJson(this);
}

@JsonSerializable()
class ImageModel {
  ImageModel(this.large, this.small);

  String? large;
  String? small;

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}

@JsonSerializable()
class RoomModel {
  RoomModel(this.overall);

  final RoomOverallModel? overall;

  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoomModelToJson(this);
}

@JsonSerializable()
class RoomOverallModel {
  RoomOverallModel(
    this.boarding,
    this.name,
    this.adultCount,
    this.childrenCount,
  );

  final String? boarding;
  final String? name;
  @JsonKey(name: "adult-count")
  final int? adultCount;
  @JsonKey(name: "children-count")
  final int? childrenCount;

  factory RoomOverallModel.fromJson(Map<String, dynamic> json) =>
      _$RoomOverallModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoomOverallModelToJson(this);
}

@JsonSerializable()
class TravelDateModel {
  TravelDateModel(this.days, this.nights);

  final int? days;
  final int? nights;

  factory TravelDateModel.fromJson(Map<String, dynamic> json) =>
      _$TravelDateModelFromJson(json);

  Map<String, dynamic> toJson() => _$TravelDateModelToJson(this);
}

@JsonSerializable()
class RatingInfoModel {
  RatingInfoModel(this.reviewsCount, this.score, this.scoreDescription);

  @JsonKey(name: "reviews-count")
  final int? reviewsCount;
  @JsonKey(name: "score-description")
  final String? scoreDescription;
  final double? score;

  factory RatingInfoModel.fromJson(Map<String, dynamic> json) =>
      _$RatingInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$RatingInfoModelToJson(this);
}
