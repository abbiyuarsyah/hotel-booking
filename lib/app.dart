import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/features/hotel/presentation/bloc/hotel_bloc.dart';
import 'package:hotel_booking/features/hotel/presentation/bloc/hotel_event.dart';

import 'core/routes/app_router.dart';
import 'core/service_locator/service_locator.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<HotelBloc>()
        ..add(const GetHotelsEvent())
        ..add(const GetFavoriteEvent()),
      child: MaterialApp.router(
        title: tr('hotel_booking'),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
