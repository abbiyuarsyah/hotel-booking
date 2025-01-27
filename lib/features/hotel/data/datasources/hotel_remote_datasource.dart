import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:hotel_booking/core/enums/http_method.dart';
import 'package:hotel_booking/core/extensions/error_extension.dart';
import 'package:hotel_booking/features/hotel/data/models/hotels_model.dart';

import '../../../../core/utils/execptions.dart';
import '../../../../core/utils/http_helper.dart';

abstract class HotelRemoteDatasource {
  Future<Either<Failure, HotelsModel>> getHotels();
}

class HotelRemoteDatasourceImpl implements HotelRemoteDatasource {
  const HotelRemoteDatasourceImpl({required this.httpClient});

  final HttpClientHelper httpClient;

  @override
  Future<Either<Failure, HotelsModel>> getHotels() async {
    try {
      final result = await httpClient.request(
        endpoint: 'hotels.json',
        method: HttpMethod.get,
      );

      if (result.statusCode == 200) {
        final response = HotelsModel.fromJson(json.decode(result.body));
        return Right(response);
      } else {
        /// Map the HTTP Error to Failure Objects
        /// It's needed to return the error messages
        return Left(result.statusCode.httpErrorToFailure);
      }
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }
}
