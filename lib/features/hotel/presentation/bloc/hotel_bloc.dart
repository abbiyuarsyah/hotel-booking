import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/core/enums/state_status.dart';
import 'package:hotel_booking/features/hotel/domain/entities/hotels_entity.dart';
import 'package:hotel_booking/features/hotel/domain/use_case/get_hotels.dart';
import 'package:hotel_booking/features/hotel/presentation/bloc/hotel_event.dart';
import 'package:hotel_booking/features/hotel/presentation/bloc/hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  HotelBloc({
    required this.getHotels,
  }) : super(
          HotelState(
            getHotelsStatus: StateStatus.init,
            hotelsEntity: HotelsEntity(
              hotels: [],
              hotelCount: 0,
            ),
            errorMessage: '',
          ),
        ) {
    on<GetHotelsEvent>(_onGetHotelsEvent);
  }

  final GetHotels getHotels;

  Future<void> _onGetHotelsEvent(
    GetHotelsEvent event,
    Emitter<HotelState> emit,
  ) async {
    emit(state.copyWith(getHotelsStatus: StateStatus.loading));

    final result = await getHotels(null);
    result.fold((l) {
      emit(state.copyWith(
        getHotelsStatus: StateStatus.failed,
        errorMessage: l.message,
      ));
    }, (r) {
      emit(state.copyWith(
        getHotelsStatus: StateStatus.loaded,
        hotelsEntity: r,
      ));
    });
  }
}
