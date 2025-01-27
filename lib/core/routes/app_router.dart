import 'package:auto_route/auto_route.dart';
import 'package:hotel_booking/core/routes/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AppNavigationRoute.page,
          path: '/',
          initial: true,
          children: [
            AutoRoute(page: OverviewRoute.page, path: 'overview'),
            AutoRoute(page: HotelListRoute.page, path: 'hotels'),
            AutoRoute(page: FavoriteRoute.page, path: 'favorite'),
            AutoRoute(page: ProfileRoute.page, path: 'profile'),
          ],
        ),
      ];
}
