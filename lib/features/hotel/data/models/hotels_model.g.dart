// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotels_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelsModel _$HotelsModelFromJson(Map<String, dynamic> json) => HotelsModel(
      (json['hotels'] as List<dynamic>?)
          ?.map((e) => HotelModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['hotel-count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HotelsModelToJson(HotelsModel instance) =>
    <String, dynamic>{
      'hotels': instance.hotels,
      'hotel-count': instance.hotelCount,
    };

HotelModel _$HotelModelFromJson(Map<String, dynamic> json) => HotelModel(
      json['best-offer'] == null
          ? null
          : BestOfferModel.fromJson(json['best-offer'] as Map<String, dynamic>),
      (json['category'] as num?)?.toInt(),
      json['destination'] as String?,
      (json['images'] as List<dynamic>?)
          ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['name'] as String?,
    );

Map<String, dynamic> _$HotelModelToJson(HotelModel instance) =>
    <String, dynamic>{
      'best-offer': instance.bestOffer,
      'category': instance.category,
      'destination': instance.destination,
      'images': instance.images,
      'name': instance.name,
    };

BestOfferModel _$BestOfferModelFromJson(Map<String, dynamic> json) =>
    BestOfferModel(
      (json['original-travel-price'] as num?)?.toDouble(),
      (json['simple-price-per-person'] as num?)?.toDouble(),
      json['rooms'] == null
          ? null
          : RoomModel.fromJson(json['rooms'] as Map<String, dynamic>),
      json['travel-date'] == null
          ? null
          : TravelDateModel.fromJson(
              json['travel-date'] as Map<String, dynamic>),
      json['flight-included'] as bool?,
    );

Map<String, dynamic> _$BestOfferModelToJson(BestOfferModel instance) =>
    <String, dynamic>{
      'original-travel-price': instance.originalTravelPrice,
      'simple-price-per-person': instance.simplePricePerPerson,
      'rooms': instance.rooms,
      'travel-date': instance.travelDate,
      'flight-included': instance.flightIncluded,
    };

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      json['large'] as String?,
      json['small'] as String?,
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'large': instance.large,
      'small': instance.small,
    };

RoomModel _$RoomModelFromJson(Map<String, dynamic> json) => RoomModel(
      json['overall'] == null
          ? null
          : RoomOverallModel.fromJson(json['overall'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RoomModelToJson(RoomModel instance) => <String, dynamic>{
      'overall': instance.overall,
    };

RoomOverallModel _$RoomOverallModelFromJson(Map<String, dynamic> json) =>
    RoomOverallModel(
      json['boarding'] as String?,
      json['name'] as String?,
      (json['adult-count'] as num?)?.toInt(),
      (json['children-count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RoomOverallModelToJson(RoomOverallModel instance) =>
    <String, dynamic>{
      'boarding': instance.boarding,
      'name': instance.name,
      'adult-count': instance.adultCount,
      'children-count': instance.childrenCount,
    };

TravelDateModel _$TravelDateModelFromJson(Map<String, dynamic> json) =>
    TravelDateModel(
      (json['days'] as num?)?.toInt(),
      (json['nights'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TravelDateModelToJson(TravelDateModel instance) =>
    <String, dynamic>{
      'days': instance.days,
      'nights': instance.nights,
    };
