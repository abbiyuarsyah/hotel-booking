import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/core/constants/custom_style.dart';
import 'package:hotel_booking/core/enums/state_status.dart';
import 'package:hotel_booking/features/hotel/presentation/bloc/hotel_bloc.dart';
import 'package:hotel_booking/features/hotel/presentation/bloc/hotel_state.dart';

import '../../../../core/constants/dimens.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/shared_widgets/app_bar_widget.dart';
import '../../../../core/shared_widgets/error_screen_wdiget.dart';
import '../bloc/hotel_event.dart';
import '../widgets/item_hotel_widget.dart';

@RoutePage()
class HotelListPage extends StatelessWidget {
  const HotelListPage({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarGeneric(title: 'Hotels'),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.large,
        ),
        child: BlocBuilder<HotelBloc, HotelState>(
          buildWhen: (previous, current) =>
              previous.getHotelsStatus != current.getHotelsStatus,
          builder: (context, state) {
            if (state.getHotelsStatus == StateStatus.loaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: Dimens.extraLarge),
                  Text(
                    '${state.hotelsEntity.hotelCount} ${tr('hotels_for_mallorca')}',
                    style: CustomStyle.subheadline,
                  ),
                  const SizedBox(height: Dimens.large - 3),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.hotelsEntity.hotels.length,
                    itemBuilder: (context, index) {
                      return ItemHotelWidget(
                        hotel: state.hotelsEntity.hotels[index],
                      );
                    },
                  )
                ],
              );
            } else if (state.getHotelsStatus == StateStatus.failed) {
              return ErrorScreenWidget(
                message: state.errorMessage,
                onPressed: () {
                  sl<HotelBloc>().add(const GetHotelsEvent());
                },
              );
            } else if (state.getHotelsStatus == StateStatus.loading) {
              return SizedBox(
                height: MediaQuery.of(context).size.height / 1.2,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
