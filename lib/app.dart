import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'features/hotel/presentation/pages/hotel_list_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Bookin',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {'/': (context) => const HotelListPage()},
    );
  }
}
