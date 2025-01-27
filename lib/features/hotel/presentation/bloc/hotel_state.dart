import 'package:equatable/equatable.dart';
import 'package:hotel_booking/features/hotel/domain/entities/hotels_entity.dart';

import '../../../../core/enums/state_status.dart';

class HotelState extends Equatable {
  const HotelState({
    required this.hotelsEntity,
    required this.getHotelsStatus,
    required this.errorMessage,
  });

  final HotelsEntity hotelsEntity;
  final StateStatus getHotelsStatus;
  final String errorMessage;

  HotelState copyWith({
    StateStatus? getHotelsStatus,
    HotelsEntity? hotelsEntity,
    String? errorMessage,
  }) {
    return HotelState(
      getHotelsStatus: getHotelsStatus ?? this.getHotelsStatus,
      hotelsEntity: hotelsEntity ?? this.hotelsEntity,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        hotelsEntity,
        getHotelsStatus,
        errorMessage,
      ];
}
