import 'package:hotel_booking/features/hotel/data/datasources/hotel_remote_datasource.dart';
import 'package:hotel_booking/features/hotel/data/repositories/hotel_repository_impl.dart';
import 'package:hotel_booking/features/hotel/domain/repositories/hotel_repsitory.dart';
import 'package:hotel_booking/features/hotel/domain/use_case/get_hotels.dart';
import 'package:hotel_booking/features/hotel/presentation/bloc/hotel_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../utils/http_helper.dart';
import '../utils/network_info.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  /// Core
  sl.registerLazySingleton(() => InternetConnection());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => const HttpClientHelper());

  /// Datasource
  sl.registerLazySingleton<HotelRemoteDatasource>(
    () => HotelRemoteDatasourceImpl(httpClient: sl()),
  );

  /// Repository
  sl.registerLazySingleton<HotelRepository>(
    () => HotelRepositoryImpl(
      networkInfo: sl(),
      datasource: sl(),
    ),
  );

  /// User case
  sl.registerLazySingleton(() => GetHotels(repository: sl()));

  /// Bloc
  sl.registerLazySingleton<HotelBloc>(
    () => HotelBloc(getHotels: sl()),
  );
}
