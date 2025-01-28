import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/core/constants/dimens.dart';
import 'package:hotel_booking/core/enums/state_status.dart';
import 'package:hotel_booking/features/hotel/presentation/bloc/hotel_bloc.dart';
import 'package:hotel_booking/features/hotel/presentation/bloc/hotel_event.dart';
import 'package:hotel_booking/features/hotel/presentation/bloc/hotel_state.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/shared_widgets/app_bar_widget.dart';
import '../../../../core/shared_widgets/error_screen_wdiget.dart';
import '../widgets/item_favorite_widget.dart';

@RoutePage()
class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    super.initState();
    sl<HotelBloc>().add(const GetFavoriteEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarGeneric(title: 'Favoriten'),
      backgroundColor: Colors.white,
      body: BlocBuilder<HotelBloc, HotelState>(
        builder: (context, state) {
          if (state.getFavoritesStatus == StateStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.getFavoritesStatus == StateStatus.loaded) {
            return ListView.builder(
              padding: const EdgeInsets.all(Dimens.large),
              itemCount: state.favorites.length,
              itemBuilder: (context, index) {
                return ItemFavoriteWidget(favorite: state.favorites[index]);
              },
            );
          } else if (state.getFavoritesStatus == StateStatus.failed) {
            return ErrorScreenWidget(
              message: state.errorMessage,
              onPressed: () {
                sl<HotelBloc>().add(const GetFavoriteEvent());
              },
            );
          } else if (state.getFavoritesStatus == StateStatus.emtpy) {
            return Center(child: Text(tr('no_data')));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
