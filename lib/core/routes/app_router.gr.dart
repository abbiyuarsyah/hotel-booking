// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:hotel_booking/features/hotel/presentation/pages/app_navigation_page.dart'
    as _i1;
import 'package:hotel_booking/features/hotel/presentation/pages/favorite_page.dart'
    as _i2;
import 'package:hotel_booking/features/hotel/presentation/pages/hotel_list_page.dart'
    as _i3;
import 'package:hotel_booking/features/hotel/presentation/pages/overview_page.dart'
    as _i4;
import 'package:hotel_booking/features/hotel/presentation/pages/profile_page.dart'
    as _i5;

/// generated route for
/// [_i1.AppNavigationPage]
class AppNavigationRoute extends _i6.PageRouteInfo<void> {
  const AppNavigationRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AppNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppNavigationRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.AppNavigationPage();
    },
  );
}

/// generated route for
/// [_i2.FavoritePage]
class FavoriteRoute extends _i6.PageRouteInfo<void> {
  const FavoriteRoute({List<_i6.PageRouteInfo>? children})
      : super(
          FavoriteRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.FavoritePage();
    },
  );
}

/// generated route for
/// [_i3.HotelListPage]
class HotelListRoute extends _i6.PageRouteInfo<void> {
  const HotelListRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HotelListRoute.name,
          initialChildren: children,
        );

  static const String name = 'HotelListRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.HotelListPage();
    },
  );
}

/// generated route for
/// [_i4.OverviewPage]
class OverviewRoute extends _i6.PageRouteInfo<void> {
  const OverviewRoute({List<_i6.PageRouteInfo>? children})
      : super(
          OverviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'OverviewRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.OverviewPage();
    },
  );
}

/// generated route for
/// [_i5.ProfilePage]
class ProfileRoute extends _i6.PageRouteInfo<void> {
  const ProfileRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.ProfilePage();
    },
  );
}
