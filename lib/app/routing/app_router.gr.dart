// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:hostel_manager/app/models/news.dart' as _i14;
import 'package:hostel_manager/app/pages/booking/add_booking.dart' as _i1;
import 'package:hostel_manager/app/pages/main/main_view.dart' as _i4;
import 'package:hostel_manager/app/pages/news/news_view.dart' as _i5;
import 'package:hostel_manager/app/pages/news/selected_news_view.dart' as _i8;
import 'package:hostel_manager/app/pages/onboarding/onboarding_view.dart'
    as _i6;
import 'package:hostel_manager/app/pages/rooms/add_room.dart' as _i2;
import 'package:hostel_manager/app/pages/rooms/filters_view.dart' as _i3;
import 'package:hostel_manager/app/pages/rooms/rooms_view.dart' as _i7;
import 'package:hostel_manager/app/pages/rooms/selected_room_view.dart' as _i9;
import 'package:hostel_manager/app/pages/settings/settings_view.dart' as _i10;
import 'package:hostel_manager/app/pages/spalsh/splash_view.dart' as _i11;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    AddBooking.name: (routeData) {
      final args = routeData.argsAs<AddBookingArgs>(
          orElse: () => const AddBookingArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddBooking(
          key: args.key,
          bookingKey: args.bookingKey,
        ),
      );
    },
    AddRoom.name: (routeData) {
      final args =
          routeData.argsAs<AddRoomArgs>(orElse: () => const AddRoomArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AddRoom(
          key: args.key,
          roomKey: args.roomKey,
        ),
      );
    },
    FiltersView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.FiltersView(),
      );
    },
    MainView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MainView(),
      );
    },
    NewsView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.NewsView(),
      );
    },
    OnBoardingView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.OnBoardingView(),
      );
    },
    RoomsView.name: (routeData) {
      final args =
          routeData.argsAs<RoomsViewArgs>(orElse: () => const RoomsViewArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.RoomsView(
          key: args.key,
          booking: args.booking,
        ),
      );
    },
    SelectedNewsView.name: (routeData) {
      final args = routeData.argsAs<SelectedNewsViewArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.SelectedNewsView(
          news: args.news,
          key: args.key,
        ),
      );
    },
    SelectedRoomView.name: (routeData) {
      final args = routeData.argsAs<SelectedRoomViewArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.SelectedRoomView(
          roomKey: args.roomKey,
          key: args.key,
        ),
      );
    },
    SettingsView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SettingsView(),
      );
    },
    SplashView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.SplashView(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddBooking]
class AddBooking extends _i12.PageRouteInfo<AddBookingArgs> {
  AddBooking({
    _i13.Key? key,
    int? bookingKey,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          AddBooking.name,
          args: AddBookingArgs(
            key: key,
            bookingKey: bookingKey,
          ),
          initialChildren: children,
        );

  static const String name = 'AddBooking';

  static const _i12.PageInfo<AddBookingArgs> page =
      _i12.PageInfo<AddBookingArgs>(name);
}

class AddBookingArgs {
  const AddBookingArgs({
    this.key,
    this.bookingKey,
  });

  final _i13.Key? key;

  final int? bookingKey;

  @override
  String toString() {
    return 'AddBookingArgs{key: $key, bookingKey: $bookingKey}';
  }
}

/// generated route for
/// [_i2.AddRoom]
class AddRoom extends _i12.PageRouteInfo<AddRoomArgs> {
  AddRoom({
    _i13.Key? key,
    int? roomKey,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          AddRoom.name,
          args: AddRoomArgs(
            key: key,
            roomKey: roomKey,
          ),
          initialChildren: children,
        );

  static const String name = 'AddRoom';

  static const _i12.PageInfo<AddRoomArgs> page =
      _i12.PageInfo<AddRoomArgs>(name);
}

class AddRoomArgs {
  const AddRoomArgs({
    this.key,
    this.roomKey,
  });

  final _i13.Key? key;

  final int? roomKey;

  @override
  String toString() {
    return 'AddRoomArgs{key: $key, roomKey: $roomKey}';
  }
}

/// generated route for
/// [_i3.FiltersView]
class FiltersView extends _i12.PageRouteInfo<void> {
  const FiltersView({List<_i12.PageRouteInfo>? children})
      : super(
          FiltersView.name,
          initialChildren: children,
        );

  static const String name = 'FiltersView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MainView]
class MainView extends _i12.PageRouteInfo<void> {
  const MainView({List<_i12.PageRouteInfo>? children})
      : super(
          MainView.name,
          initialChildren: children,
        );

  static const String name = 'MainView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.NewsView]
class NewsView extends _i12.PageRouteInfo<void> {
  const NewsView({List<_i12.PageRouteInfo>? children})
      : super(
          NewsView.name,
          initialChildren: children,
        );

  static const String name = 'NewsView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i6.OnBoardingView]
class OnBoardingView extends _i12.PageRouteInfo<void> {
  const OnBoardingView({List<_i12.PageRouteInfo>? children})
      : super(
          OnBoardingView.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i7.RoomsView]
class RoomsView extends _i12.PageRouteInfo<RoomsViewArgs> {
  RoomsView({
    _i13.Key? key,
    bool booking = false,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          RoomsView.name,
          args: RoomsViewArgs(
            key: key,
            booking: booking,
          ),
          initialChildren: children,
        );

  static const String name = 'RoomsView';

  static const _i12.PageInfo<RoomsViewArgs> page =
      _i12.PageInfo<RoomsViewArgs>(name);
}

class RoomsViewArgs {
  const RoomsViewArgs({
    this.key,
    this.booking = false,
  });

  final _i13.Key? key;

  final bool booking;

  @override
  String toString() {
    return 'RoomsViewArgs{key: $key, booking: $booking}';
  }
}

/// generated route for
/// [_i8.SelectedNewsView]
class SelectedNewsView extends _i12.PageRouteInfo<SelectedNewsViewArgs> {
  SelectedNewsView({
    required _i14.News news,
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          SelectedNewsView.name,
          args: SelectedNewsViewArgs(
            news: news,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SelectedNewsView';

  static const _i12.PageInfo<SelectedNewsViewArgs> page =
      _i12.PageInfo<SelectedNewsViewArgs>(name);
}

class SelectedNewsViewArgs {
  const SelectedNewsViewArgs({
    required this.news,
    this.key,
  });

  final _i14.News news;

  final _i13.Key? key;

  @override
  String toString() {
    return 'SelectedNewsViewArgs{news: $news, key: $key}';
  }
}

/// generated route for
/// [_i9.SelectedRoomView]
class SelectedRoomView extends _i12.PageRouteInfo<SelectedRoomViewArgs> {
  SelectedRoomView({
    required int roomKey,
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          SelectedRoomView.name,
          args: SelectedRoomViewArgs(
            roomKey: roomKey,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SelectedRoomView';

  static const _i12.PageInfo<SelectedRoomViewArgs> page =
      _i12.PageInfo<SelectedRoomViewArgs>(name);
}

class SelectedRoomViewArgs {
  const SelectedRoomViewArgs({
    required this.roomKey,
    this.key,
  });

  final int roomKey;

  final _i13.Key? key;

  @override
  String toString() {
    return 'SelectedRoomViewArgs{roomKey: $roomKey, key: $key}';
  }
}

/// generated route for
/// [_i10.SettingsView]
class SettingsView extends _i12.PageRouteInfo<void> {
  const SettingsView({List<_i12.PageRouteInfo>? children})
      : super(
          SettingsView.name,
          initialChildren: children,
        );

  static const String name = 'SettingsView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.SplashView]
class SplashView extends _i12.PageRouteInfo<void> {
  const SplashView({List<_i12.PageRouteInfo>? children})
      : super(
          SplashView.name,
          initialChildren: children,
        );

  static const String name = 'SplashView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}
