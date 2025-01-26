import 'package:flutter/material.dart';
import 'package:hotel_booking/core/constants/custom_colors.dart';
import 'package:hotel_booking/core/constants/custom_style.dart';
import 'package:hotel_booking/core/shared_widgets/card_container.dart';

import '../../../../core/constants/dimens.dart';

class HotelListPage extends StatelessWidget {
  const HotelListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.blue,
        title: const Text(
          'Hotels',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.large,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: Dimens.extraLarge),
            Text(
              '1.620 Hotels für Mallorca',
              style: CustomStyle.subheadline,
            ),
            const SizedBox(height: Dimens.large - 3),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return CardContainer(
                  margin: EdgeInsets.only(bottom: Dimens.large),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: Dimens.large),
                      Row(
                        children: [
                          const SizedBox(
                            width: 80,
                          ),
                          const SizedBox(
                            child: Icon(
                              Icons.help_outline,
                              color: CustomColors.grey,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: Dimens.small),
                      Text(
                        'Hotel AluaVillage Blue Beach',
                        style: CustomStyle.title,
                      ),
                      Text(
                        'Playa de Esquinzo, Fuerteventura, Spanien',
                        style: CustomStyle.subtitle,
                      ),
                      const SizedBox(height: Dimens.medium),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '8 Tage | 7 Nächte',
                                style: CustomStyle.body,
                              ),
                              Text(
                                'Doppelzimmer | Frühstück',
                                style: CustomStyle.body,
                              ),
                              Text(
                                '2 Erw., 2 Kinder | inkl. Flug',
                                style: CustomStyle.body,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'ab',
                                    style: CustomStyle.body,
                                  ),
                                  const SizedBox(width: Dimens.small),
                                  Text(
                                    '1.279,00 €',
                                    style: CustomStyle.headline,
                                  ),
                                ],
                              ),
                              Text(
                                '319,75 € p.P',
                                style: CustomStyle.body,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: Dimens.large),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                Dimens.medium,
                              ),
                            ),
                          ),
                          child: Text(
                            'Test',
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
