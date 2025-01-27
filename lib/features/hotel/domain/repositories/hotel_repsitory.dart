import 'package:dartz/dartz.dart';

import '../../../../core/utils/execptions.dart';
import '../../data/models/hotels_model.dart';

abstract class HotelRepository {
  Future<Either<Failure, HotelsModel>> getHotels();
}
