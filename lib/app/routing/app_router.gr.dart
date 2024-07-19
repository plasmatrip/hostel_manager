// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:hostel_manager/app/models/news.dart' as _i16;
import 'package:hostel_manager/app/models/room.dart' as _i15;
import 'package:hostel_manager/app/pages/booking/add_booking.dart' as _i1;
import 'package:hostel_manager/app/pages/main/main_view.dart' as _i5;
import 'package:hostel_manager/app/pages/news/news_view.dart' as _i6;
import 'package:hostel_manager/app/pages/news/selected_news_view.dart' as _i9;
import 'package:hostel_manager/app/pages/onboarding/onboarding_view.dart' as _i7;
import 'package:hostel_manager/app/pages/rooms/add_room.dart' as _i2;
import 'package:hostel_manager/app/pages/rooms/filters_view.dart' as _i4;
import 'package:hostel_manager/app/pages/rooms/rooms_view.dart' as _i8;
import 'package:hostel_manager/app/pages/rooms/selected_room_view.dart' as _i10;
import 'package:hostel_manager/app/pages/rooms/calendar_view.dart' as _i3;
import 'package:hostel_manager/app/pages/settings/settings_view.dart' as _i11;
import 'package:hostel_manager/app/pages/spalsh/splash_view.dart' as _i12;

abstract class $AppRouter extends _i13.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    AddBooking.name: (routeData) {
      final args = routeData.argsAs<AddBookingArgs>(orElse: () => const AddBookingArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddBooking(
          key: args.key,
          bookingKey: args.bookingKey,
          room: args.room,
        ),
      );
    },
    AddRoom.name: (routeData) {
      final args = routeData.argsAs<AddRoomArgs>(orElse: () => const AddRoomArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AddRoom(
          key: args.key,
          roomKey: args.roomKey,
        ),
      );
    },
    CalendarView.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CalendarView(),
      );
    },
    FiltersView.name: (routeData) {
      final args = routeData.argsAs<FiltersViewArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.FiltersView(
          booking: args.booking,
          key: args.key,
        ),
      );
    },
    MainView.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.MainView(),
      );
    },
    NewsView.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.NewsView(),
      );
    },
    OnBoardingView.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.OnBoardingView(),
      );
    },
    RoomsView.name: (routeData) {
      final args = routeData.argsAs<RoomsViewArgs>(orElse: () => const RoomsViewArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.RoomsView(
          key: args.key,
          booking: args.booking,
        ),
      );
    },
    SelectedNewsView.name: (routeData) {
      final args = routeData.argsAs<SelectedNewsViewArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.SelectedNewsView(
          news: args.news,
          key: args.key,
        ),
      );
    },
    SelectedRoomView.name: (routeData) {
      final args = routeData.argsAs<SelectedRoomViewArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.SelectedRoomView(
          roomKey: args.roomKey,
          key: args.key,
        ),
      );
    },
    SettingsView.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.SettingsView(),
      );
    },
    SplashView.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SplashView(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddBooking]
class AddBooking extends _i13.PageRouteInfo<AddBookingArgs> {
  AddBooking({
    _i14.Key? key,
    int? bookingKey,
    _i15.Room? room,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          AddBooking.name,
          args: AddBookingArgs(
            key: key,
            bookingKey: bookingKey,
            room: room,
          ),
          initialChildren: children,
        );

  static const String name = 'AddBooking';

  static const _i13.PageInfo<AddBookingArgs> page = _i13.PageInfo<AddBookingArgs>(name);
}

class AddBookingArgs {
  const AddBookingArgs({
    this.key,
    this.bookingKey,
    this.room,
  });

  final _i14.Key? key;

  final int? bookingKey;

  final _i15.Room? room;

  @override
  String toString() {
    return 'AddBookingArgs{key: $key, bookingKey: $bookingKey, room: $room}';
  }
}

/// generated route for
/// [_i2.AddRoom]
class AddRoom extends _i13.PageRouteInfo<AddRoomArgs> {
  AddRoom({
    _i14.Key? key,
    int? roomKey,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          AddRoom.name,
          args: AddRoomArgs(
            key: key,
            roomKey: roomKey,
          ),
          initialChildren: children,
        );

  static const String name = 'AddRoom';

  static const _i13.PageInfo<AddRoomArgs> page = _i13.PageInfo<AddRoomArgs>(name);
}

class AddRoomArgs {
  const AddRoomArgs({
    this.key,
    this.roomKey,
  });

  final _i14.Key? key;

  final int? roomKey;

  @override
  String toString() {
    return 'AddRoomArgs{key: $key, roomKey: $roomKey}';
  }
}

/// generated route for
/// [_i3.CalendarView]
class CalendarView extends _i13.PageRouteInfo<void> {
  const CalendarView({List<_i13.PageRouteInfo>? children})
      : super(
          CalendarView.name,
          initialChildren: children,
        );

  static const String name = 'CalendarView';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i4.FiltersView]
class FiltersView extends _i13.PageRouteInfo<FiltersViewArgs> {
  FiltersView({
    required bool booking,
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          FiltersView.name,
          args: FiltersViewArgs(
            booking: booking,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'FiltersView';

  static const _i13.PageInfo<FiltersViewArgs> page = _i13.PageInfo<FiltersViewArgs>(name);
}

class FiltersViewArgs {
  const FiltersViewArgs({
    required this.booking,
    this.key,
  });

  final bool booking;

  final _i14.Key? key;

  @override
  String toString() {
    return 'FiltersViewArgs{booking: $booking, key: $key}';
  }
}

/// generated route for
/// [_i5.MainView]
class MainView extends _i13.PageRouteInfo<void> {
  const MainView({List<_i13.PageRouteInfo>? children})
      : super(
          MainView.name,
          initialChildren: children,
        );

  static const String name = 'MainView';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i6.NewsView]
class NewsView extends _i13.PageRouteInfo<void> {
  const NewsView({List<_i13.PageRouteInfo>? children})
      : super(
          NewsView.name,
          initialChildren: children,
        );

  static const String name = 'NewsView';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i7.OnBoardingView]
class OnBoardingView extends _i13.PageRouteInfo<void> {
  const OnBoardingView({List<_i13.PageRouteInfo>? children})
      : super(
          OnBoardingView.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingView';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i8.RoomsView]
class RoomsView extends _i13.PageRouteInfo<RoomsViewArgs> {
  RoomsView({
    _i14.Key? key,
    bool booking = false,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          RoomsView.name,
          args: RoomsViewArgs(
            key: key,
            booking: booking,
          ),
          initialChildren: children,
        );

  static const String name = 'RoomsView';

  static const _i13.PageInfo<RoomsViewArgs> page = _i13.PageInfo<RoomsViewArgs>(name);
}

class RoomsViewArgs {
  const RoomsViewArgs({
    this.key,
    this.booking = false,
  });

  final _i14.Key? key;

  final bool booking;

  @override
  String toString() {
    return 'RoomsViewArgs{key: $key, booking: $booking}';
  }
}

/// generated route for
/// [_i9.SelectedNewsView]
class SelectedNewsView extends _i13.PageRouteInfo<SelectedNewsViewArgs> {
  SelectedNewsView({
    required _i16.News news,
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          SelectedNewsView.name,
          args: SelectedNewsViewArgs(
            news: news,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SelectedNewsView';

  static const _i13.PageInfo<SelectedNewsViewArgs> page = _i13.PageInfo<SelectedNewsViewArgs>(name);
}

class SelectedNewsViewArgs {
  const SelectedNewsViewArgs({
    required this.news,
    this.key,
  });

  final _i16.News news;

  final _i14.Key? key;

  @override
  String toString() {
    return 'SelectedNewsViewArgs{news: $news, key: $key}';
  }
}

/// generated route for
/// [_i10.SelectedRoomView]
class SelectedRoomView extends _i13.PageRouteInfo<SelectedRoomViewArgs> {
  SelectedRoomView({
    required int roomKey,
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          SelectedRoomView.name,
          args: SelectedRoomViewArgs(
            roomKey: roomKey,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SelectedRoomView';

  static const _i13.PageInfo<SelectedRoomViewArgs> page = _i13.PageInfo<SelectedRoomViewArgs>(name);
}

class SelectedRoomViewArgs {
  const SelectedRoomViewArgs({
    required this.roomKey,
    this.key,
  });

  final int roomKey;

  final _i14.Key? key;

  @override
  String toString() {
    return 'SelectedRoomViewArgs{roomKey: $roomKey, key: $key}';
  }
}

/// generated route for
/// [_i11.SettingsView]
class SettingsView extends _i13.PageRouteInfo<void> {
  const SettingsView({List<_i13.PageRouteInfo>? children})
      : super(
          SettingsView.name,
          initialChildren: children,
        );

  static const String name = 'SettingsView';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i12.SplashView]
class SplashView extends _i13.PageRouteInfo<void> {
  const SplashView({List<_i13.PageRouteInfo>? children})
      : super(
          SplashView.name,
          initialChildren: children,
        );

  static const String name = 'SplashView';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}
