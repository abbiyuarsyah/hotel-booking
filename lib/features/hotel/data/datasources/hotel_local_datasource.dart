import 'package:hive/hive.dart';
import 'package:hotel_booking/features/hotel/data/models/favorite_model.dart';

abstract class HotelLocalDatasource {
  Future<List<FavoriteModel>> getFavorites();
  Future<bool> deleteFavorite(FavoriteModel model);
  Future<bool> addToFavorite(FavoriteModel model);
}

class HotelLocalDatasourceImpl implements HotelLocalDatasource {
  HotelLocalDatasourceImpl._({required hiveInterface})
      : _hiveInterface = hiveInterface;

  final HiveInterface _hiveInterface;
  late Box _box;
  bool _initialized = false;

  static Future<HotelLocalDatasourceImpl> create(
      {required hiveInterface}) async {
    final repo = HotelLocalDatasourceImpl._(hiveInterface: hiveInterface);

    await repo.init();
    await repo.open();

    return repo;
  }

  @override
  Future<List<FavoriteModel>> getFavorites() {
    final values = _box.values.toList().cast<FavoriteModel>();
    return values.isEmpty
        ? Future.value([FavoriteModel.empty()])
        : Future.value(values);
  }

  @override
  Future<bool> addToFavorite(FavoriteModel model) async {
    await _box.put(model.id, model);
    return true;
  }

  @override
  Future<bool> deleteFavorite(FavoriteModel model) async {
    final key = _box.keys.firstWhere(
      (k) => _box.get(k) == model,
      orElse: () => null,
    );
    await _box.delete(key);

    return true;
  }

  Future<void> init() async {
    bool isInitializing = false;
    if (_initialized == false && isInitializing == false) {
      isInitializing = true;
      _hiveInterface.registerAdapter(FavoriteModelAdapter());
      _initialized = true;
    }
  }

  Future<void> open() async {
    _box = await _hiveInterface.openBox(FavoriteModel.boxName);
  }
}
