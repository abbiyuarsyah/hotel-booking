class HotelsEntity {
  HotelsEntity({required this.hotels, required this.hotelCount});

  final List<HotelEntity> hotels;
  final int hotelCount;
}

class HotelEntity {
  HotelEntity({
    required this.bestOffer,
    required this.category,
    required this.destination,
    required this.images,
    required this.name,
    required this.rating,
  });

  final BestOfferEntity bestOffer;
  final int category;
  final String destination;
  final List<ImageEntity> images;
  final String name;
  final RatingInfoEntity rating;
}

class BestOfferEntity {
  BestOfferEntity({
    required this.originalTravelPrice,
    required this.simplePricePerPerson,
    required this.rooms,
    required this.travelDate,
    required this.flightIncluded,
  });

  final double originalTravelPrice;
  final double simplePricePerPerson;
  final RoomEntity rooms;
  final TravelDateEntity travelDate;
  final bool flightIncluded;
}

class ImageEntity {
  ImageEntity({required this.large, required this.small});

  final String large;
  final String small;
}

class RoomEntity {
  RoomEntity({required this.overall});

  final RoomOverallEntity overall;
}

class RoomOverallEntity {
  RoomOverallEntity({
    required this.boarding,
    required this.name,
    required this.adultCount,
    required this.childrenCount,
  });

  final String boarding;
  final String name;
  final int adultCount;
  final int childrenCount;
}

class TravelDateEntity {
  TravelDateEntity({required this.days, required this.nights});

  final int days;
  final int nights;
}

class RatingInfoEntity {
  RatingInfoEntity({
    required this.reviewsCount,
    required this.score,
    required this.scoreDescription,
  });

  final int reviewsCount;
  final String scoreDescription;
  final double score;
}
