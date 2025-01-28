import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking/core/enums/state_status.dart';
import 'package:hotel_booking/core/shared_widgets/error_screen_wdiget.dart';
import 'package:hotel_booking/core/utils/execptions.dart';
import 'package:hotel_booking/features/hotel/domain/entities/favorite_entity.dart';
import 'package:hotel_booking/features/hotel/domain/entities/hotels_entity.dart';
import 'package:hotel_booking/features/hotel/domain/use_case/add_to_favorite.dart';
import 'package:hotel_booking/features/hotel/domain/use_case/delete_favorite.dart';
import 'package:hotel_booking/features/hotel/domain/use_case/get_favorites.dart';
import 'package:hotel_booking/features/hotel/domain/use_case/get_hotels.dart';
import 'package:hotel_booking/features/hotel/presentation/bloc/hotel_bloc.dart';
import 'package:hotel_booking/features/hotel/presentation/bloc/hotel_event.dart';
import 'package:hotel_booking/features/hotel/presentation/bloc/hotel_state.dart';
import 'package:hotel_booking/features/hotel/presentation/pages/favorite_page.dart';
import 'package:hotel_booking/features/hotel/presentation/pages/hotel_list_page.dart';
import 'package:hotel_booking/features/hotel/presentation/widgets/item_favorite_widget.dart';
import 'package:hotel_booking/features/hotel/presentation/widgets/item_hotel_widget.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'hotel_bloc_test.mocks.dart';

@GenerateMocks([
  GetHotels,
  AddToFavorite,
  GetFavorites,
  DeleteFavorite,
  HotelBloc,
])
void main() {
  late GetHotels getHotels;
  late AddToFavorite addToFavorite;
  late GetFavorites getFavorites;
  late DeleteFavorite deleteFavorite;
  late HotelBloc hotelBloc;
  late HotelState hotelState;
  late HotelsEntity hotelsEntity;
  late List<FavoriteEntity> favorites;

  setUp(() async {
    getHotels = MockGetHotels();
    getFavorites = MockGetFavorites();
    deleteFavorite = MockDeleteFavorite();
    addToFavorite = MockAddToFavorite();
    hotelBloc = MockHotelBloc();
    hotelState = HotelState(
      getHotelsStatus: StateStatus.init,
      deleteFavoriteStatus: StateStatus.init,
      addToFavoriteStatus: StateStatus.init,
      getFavoritesStatus: StateStatus.init,
      hotelsEntity: HotelsEntity(
        hotels: [],
        hotelCount: 0,
      ),
      errorMessage: '',
      favorites: const [],
      addToFavoriteFlag: false,
      favoritesHolder: const [],
    );

    hotelsEntity = HotelsEntity(
      hotels: [
        HotelEntity(
          hotelId: "2",
          bestOffer: BestOfferEntity(
            originalTravelPrice: 400,
            simplePricePerPerson: 200,
            rooms: RoomEntity(
              overall: RoomOverallEntity(
                boarding: 'Test',
                name: 'Test',
                adultCount: 2,
                childrenCount: 3,
              ),
            ),
            travelDate: TravelDateEntity(
              days: 4,
              nights: 5,
            ),
            flightIncluded: false,
          ),
          category: 4,
          destination: "Test",
          images: [],
          name: "Test",
          rating: RatingInfoEntity(
            reviewsCount: 2,
            score: 2,
            scoreDescription: 'Test',
          ),
          isAddedToFavorite: true,
        )
      ],
      hotelCount: 900,
    );

    favorites = [
      const FavoriteEntity(
        id: "2",
        images: [],
        name: "Test",
        destination: "Test",
        score: 2,
        scoreDescription: "Test",
        reviewsCount: 2,
      )
    ];
  });

  Widget createHotelListPageWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<HotelBloc>(
        create: (_) => hotelBloc,
        child: const HotelListPage(),
      ),
    );
  }

  Widget createFavoritesPageWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<HotelBloc>(
        create: (_) => hotelBloc,
        child: const FavoritePage(),
      ),
    );
  }

  group("widget test", () {
    testWidgets('displays loading indicator when getHotels is loading',
        (WidgetTester tester) async {
      when(hotelBloc.state).thenReturn(
        hotelState.copyWith(getHotelsStatus: StateStatus.loading),
      );
      when(hotelBloc.stream).thenAnswer(
        (_) => Stream.value(
          hotelState.copyWith(getHotelsStatus: StateStatus.loading),
        ),
      );

      await tester.pumpWidget(createHotelListPageWidgetUnderTest());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('displays error screen when state is failed',
        (WidgetTester tester) async {
      final errorMessage = tr('unexpected_error');

      when(hotelBloc.state).thenReturn(
        hotelState.copyWith(
          getHotelsStatus: StateStatus.failed,
          errorMessage: errorMessage,
        ),
      );
      when(hotelBloc.stream).thenAnswer(
        (_) => Stream.value(
          hotelState.copyWith(
            getHotelsStatus: StateStatus.failed,
            errorMessage: errorMessage,
          ),
        ),
      );

      await tester.pumpWidget(createHotelListPageWidgetUnderTest());

      expect(find.text(errorMessage), findsOneWidget);
      expect(find.byType(ErrorScreenWidget), findsOneWidget);
    });

    testWidgets('displays hotels when state is loaded',
        (WidgetTester tester) async {
      when(hotelBloc.state).thenReturn(
        hotelState.copyWith(
          getHotelsStatus: StateStatus.loaded,
          hotelsEntity: hotelsEntity,
        ),
      );
      when(hotelBloc.stream).thenAnswer(
        (_) => Stream.value(
          hotelState.copyWith(
            getHotelsStatus: StateStatus.loaded,
            hotelsEntity: hotelsEntity,
          ),
        ),
      );

      await tester.pumpWidget(createHotelListPageWidgetUnderTest());
      expect(find.byType(ItemHotelWidget), findsOneWidget);
    });

    testWidgets('displays loading indicator when getFavorites is loading',
        (WidgetTester tester) async {
      when(hotelBloc.state).thenReturn(
        hotelState.copyWith(getFavoritesStatus: StateStatus.loading),
      );
      when(hotelBloc.stream).thenAnswer(
        (_) => Stream.value(
          hotelState.copyWith(getFavoritesStatus: StateStatus.loading),
        ),
      );

      await tester.pumpWidget(createFavoritesPageWidgetUnderTest());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('displays error screen when state is failed',
        (WidgetTester tester) async {
      final errorMessage = tr('unexpected_error');

      when(hotelBloc.state).thenReturn(
        hotelState.copyWith(
          getFavoritesStatus: StateStatus.failed,
          errorMessage: errorMessage,
        ),
      );
      when(hotelBloc.stream).thenAnswer(
        (_) => Stream.value(
          hotelState.copyWith(
            getFavoritesStatus: StateStatus.failed,
            errorMessage: errorMessage,
          ),
        ),
      );

      await tester.pumpWidget(createFavoritesPageWidgetUnderTest());

      expect(find.text(errorMessage), findsOneWidget);
      expect(find.byType(ErrorScreenWidget), findsOneWidget);
    });

    testWidgets('displays favorites when state is loaded',
        (WidgetTester tester) async {
      when(hotelBloc.state).thenReturn(
        hotelState.copyWith(
          getFavoritesStatus: StateStatus.loaded,
          favorites: favorites,
        ),
      );
      when(hotelBloc.stream).thenAnswer(
        (_) => Stream.value(
          hotelState.copyWith(
            getFavoritesStatus: StateStatus.loaded,
            favorites: favorites,
          ),
        ),
      );

      await tester.pumpWidget(createFavoritesPageWidgetUnderTest());
      expect(find.byType(ItemFavoriteWidget), findsOneWidget);
    });
  });

  group("unit test and use case test", () {
    test(
      'getHotels should emit [loading, failed] when data fetching fails',
      () async* {
        when(getHotels(DateTime.now())).thenAnswer(
          (_) async => Left(UnexpectedFailure()),
        );

        final expected = [
          hotelState.copyWith(getHotelsStatus: StateStatus.init),
          hotelState.copyWith(getHotelsStatus: StateStatus.loading),
          hotelState.copyWith(getHotelsStatus: StateStatus.failed),
        ];
        expectLater(hotelBloc, emitsInOrder(expected));
        hotelBloc.add(const GetHotelsEvent());
      },
    );

    test(
      'getHotels should emit [Loading, loaded] when data is fetched successfully',
      () async* {
        when(getHotels(null)).thenAnswer(
          (_) async => Right(HotelsEntity(hotels: [], hotelCount: 900)),
        );

        final expected = [
          hotelState.copyWith(getHotelsStatus: StateStatus.init),
          hotelState.copyWith(getHotelsStatus: StateStatus.loading),
          hotelState.copyWith(getHotelsStatus: StateStatus.loaded),
        ];
        expectLater(hotelBloc, emitsInOrder(expected));
        hotelBloc.add(const GetHotelsEvent());
      },
    );

    test(
      'getFavorites should emit [loading, failed] when data fetching fails',
      () async* {
        when(getFavorites(null)).thenAnswer(
          (_) async => Left(UnexpectedFailure()),
        );

        final expected = [
          hotelState.copyWith(getFavoritesStatus: StateStatus.init),
          hotelState.copyWith(getFavoritesStatus: StateStatus.loading),
          hotelState.copyWith(getFavoritesStatus: StateStatus.failed),
        ];
        expectLater(hotelBloc, emitsInOrder(expected));
        hotelBloc.add(const GetFavoriteEvent());
      },
    );

    test(
      'getFavorites should emit [Loading, loaded] when data is fetched successfully',
      () async* {
        when(getHotels(DateTime.now())).thenAnswer(
          (_) async => Right(HotelsEntity(hotels: [], hotelCount: 900)),
        );

        final expected = [
          hotelState.copyWith(getFavoritesStatus: StateStatus.init),
          hotelState.copyWith(getFavoritesStatus: StateStatus.loading),
          hotelState.copyWith(getFavoritesStatus: StateStatus.loaded),
        ];
        expectLater(hotelBloc, emitsInOrder(expected));
        hotelBloc.add(const GetFavoriteEvent());
      },
    );

    test(
      'addToFavorite should emit [loading, failed] when data triggering fails',
      () async* {
        when(
          addToFavorite(
            const FavoriteEntity(
              id: "2",
              images: [],
              name: "Test",
              destination: "Test",
              score: 2,
              scoreDescription: "Test",
              reviewsCount: 2,
            ),
          ),
        ).thenAnswer(
          (_) async => Left(UnexpectedFailure()),
        );

        final expected = [
          hotelState.copyWith(addToFavoriteStatus: StateStatus.init),
          hotelState.copyWith(addToFavoriteStatus: StateStatus.loading),
          hotelState.copyWith(addToFavoriteStatus: StateStatus.failed),
        ];
        expectLater(hotelBloc, emitsInOrder(expected));
        hotelBloc.add(AddToFavoriteEvent(entity: hotelsEntity.hotels.first));
      },
    );

    test(
      'addToFavorite should emit [Loading, loaded] when data is triggered successfully',
      () async* {
        when(
          addToFavorite(
            const FavoriteEntity(
              id: "2",
              images: [],
              name: "Test",
              destination: "Test",
              score: 2,
              scoreDescription: "Test",
              reviewsCount: 2,
            ),
          ),
        ).thenAnswer(
          (_) async => const Right(true),
        );

        final expected = [
          hotelState.copyWith(getFavoritesStatus: StateStatus.init),
          hotelState.copyWith(getFavoritesStatus: StateStatus.loading),
          hotelState.copyWith(getFavoritesStatus: StateStatus.loaded),
        ];
        expectLater(hotelBloc, emitsInOrder(expected));
        hotelBloc.add(AddToFavoriteEvent(entity: hotelsEntity.hotels.first));
      },
    );

    test(
      'deletFavorite should emit [loading, failed] when data triggering fails',
      () async* {
        when(deleteFavorite(const FavoriteEntity(
          id: "2",
          images: [],
          name: "Test",
          destination: "Test",
          score: 2,
          scoreDescription: "Test",
          reviewsCount: 2,
        ))).thenAnswer(
          (_) async => Left(UnexpectedFailure()),
        );

        final expected = [
          hotelState.copyWith(addToFavoriteStatus: StateStatus.init),
          hotelState.copyWith(addToFavoriteStatus: StateStatus.loading),
          hotelState.copyWith(addToFavoriteStatus: StateStatus.failed),
        ];
        expectLater(hotelBloc, emitsInOrder(expected));
        hotelBloc.add(
          const DeleteFavoriteEvent(
            entity: FavoriteEntity(
              id: "2",
              images: [],
              name: "Test",
              destination: "Test",
              score: 2,
              scoreDescription: "Test",
              reviewsCount: 2,
            ),
          ),
        );
      },
    );

    test(
      'deletFavorite should emit [Loading, loaded] when data is triggered successfully',
      () async* {
        when(deleteFavorite(const FavoriteEntity(
          id: "2",
          images: [],
          name: "Test",
          destination: "Test",
          score: 2,
          scoreDescription: "Test",
          reviewsCount: 2,
        ))).thenAnswer(
          (_) async => const Right(true),
        );

        final expected = [
          hotelState.copyWith(getFavoritesStatus: StateStatus.init),
          hotelState.copyWith(getFavoritesStatus: StateStatus.loading),
          hotelState.copyWith(getFavoritesStatus: StateStatus.loaded),
        ];
        expectLater(hotelBloc, emitsInOrder(expected));
        hotelBloc.add(
          const DeleteFavoriteEvent(
            entity: FavoriteEntity(
              id: "2",
              images: [],
              name: "Test",
              destination: "Test",
              score: 2,
              scoreDescription: "Test",
              reviewsCount: 2,
            ),
          ),
        );
      },
    );
  });
}
