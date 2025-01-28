import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking/core/utils/execptions.dart';
import 'package:hotel_booking/core/utils/http_helper.dart';
import 'package:hotel_booking/features/hotel/data/datasources/hotel_remote_datasource.dart';
import 'package:hotel_booking/features/hotel/data/models/hotels_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'hotel_remote_datasource_test.mocks.dart';

@GenerateMocks([HttpClientHelper])
void main() {
  late HttpClientHelper clientHelper;
  late HotelRemoteDatasourceImpl dataSource;
  late HotelsModel hotelsModel;

  setUp(() {
    clientHelper = MockHttpClientHelper();
    dataSource = HotelRemoteDatasourceImpl(httpClient: clientHelper);
    hotelsModel = HotelsModel([], 90);
  });

  test("return the model when fetching hotels", () async {
    final response = hotelsModel;

    when(
      dataSource.getHotels(),
    ).thenAnswer(
      (_) async => Future.value(Right(response)),
    );

    final result = await dataSource.getHotels();

    result.fold(
      (l) => null,
      (r) => expect(r, response),
    );
  });

  test("return unexpected failure when calling hotels API", () async {
    when(
      dataSource.getHotels(),
    ).thenAnswer((_) async => Future.value(Left(UnexpectedFailure())));

    final result = await dataSource.getHotels();

    result.fold((l) => expect(l, UnexpectedFailure()), (r) => null);
  });
}
