import 'package:hive/hive.dart';
import 'package:hotel_booking/features/hotel/data/datasources/hotel_local_datasource.dart';
import 'package:hotel_booking/features/hotel/data/datasources/hotel_remote_datasource.dart';
import 'package:hotel_booking/features/hotel/data/repositories/hotel_repository_impl.dart';
import 'package:hotel_booking/features/hotel/domain/repositories/hotel_repsitory.dart';
import 'package:hotel_booking/features/hotel/domain/use_case/add_to_favorite.dart';
import 'package:hotel_booking/features/hotel/domain/use_case/delete_favorite.dart';
import 'package:hotel_booking/features/hotel/domain/use_case/get_favorites.dart';
import 'package:hotel_booking/features/hotel/domain/use_case/get_hotels.dart';
import 'package:hotel_booking/features/hotel/presentation/bloc/hotel_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

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
  sl.registerSingletonAsync<HotelLocalDatasource>(() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(join(directory.path, 'local_storage'));

    return await HotelLocalDatasourceImpl.create(hiveInterface: Hive);
  });

  // Wait for ExpenseDatasource to initialize
  await sl.isReady<HotelLocalDatasource>();

  /// Repository
  sl.registerLazySingleton<HotelRepository>(
    () => HotelRepositoryImpl(
      networkInfo: sl(),
      datasource: sl(),
      localDatasource: sl(),
    ),
  );

  /// User case
  sl.registerLazySingleton(() => GetHotels(repository: sl()));
  sl.registerLazySingleton(() => GetFavorites(repository: sl()));
  sl.registerLazySingleton(() => AddToFavorite(repository: sl()));
  sl.registerLazySingleton(() => DeleteFavorite(repository: sl()));

  /// Bloc
  sl.registerLazySingleton<HotelBloc>(
    () => HotelBloc(
      getHotels: sl(),
      deleteFavorite: sl(),
      addToFavorite: sl(),
      getFavorites: sl(),
    ),
  );
}
