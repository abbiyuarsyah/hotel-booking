import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/core/constants/custom_colors.dart';
import 'package:hotel_booking/core/constants/custom_style.dart';
import 'package:hotel_booking/core/routes/app_router.gr.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/custom_images.dart';
import '../../../../core/constants/dimens.dart';

@RoutePage()
class AppNavigationPage extends StatelessWidget {
  const AppNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        OverviewRoute(),
        HotelListRoute(),
        FavoriteRoute(),
        ProfileRoute(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            unselectedItemColor: CustomColors.grey,
            selectedItemColor: CustomColors.grey,
            selectedLabelStyle: CustomStyle.body,
            unselectedLabelStyle: CustomStyle.body,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                label: tr('overview'),
                icon: Padding(
                  padding: const EdgeInsets.only(
                    bottom: Dimens.medium,
                    top: Dimens.large,
                  ),
                  child: SvgPicture.asset(
                    CustomImages.iconOverview,
                    colorFilter: const ColorFilter.mode(
                      CustomColors.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: tr('search'),
                icon: Padding(
                  padding: const EdgeInsets.only(
                    bottom: Dimens.medium,
                    top: Dimens.large,
                  ),
                  child: SvgPicture.asset(
                    CustomImages.iconSearch,
                    colorFilter: const ColorFilter.mode(
                      CustomColors.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: tr('favorite'),
                icon: Padding(
                  padding: const EdgeInsets.only(
                    bottom: Dimens.medium,
                    top: Dimens.large,
                  ),
                  child: SvgPicture.asset(
                    CustomImages.iconFavorite,
                    colorFilter: const ColorFilter.mode(
                      CustomColors.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: tr('account'),
                icon: Padding(
                  padding: const EdgeInsets.only(
                    bottom: Dimens.medium,
                    top: Dimens.large,
                  ),
                  child: SvgPicture.asset(
                    CustomImages.iconProfile,
                    colorFilter: const ColorFilter.mode(
                      CustomColors.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
