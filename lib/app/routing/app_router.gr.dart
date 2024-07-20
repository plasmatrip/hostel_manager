// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/material.dart' as _i18;
import 'package:hostel_manager/app/models/news.dart' as _i20;
import 'package:hostel_manager/app/models/room.dart' as _i19;
import 'package:hostel_manager/app/pages/booking/add_booking.dart' as _i1;
import 'package:hostel_manager/app/pages/booking/booking_view.dart' as _i4;
import 'package:hostel_manager/app/pages/booking/calendar_view.dart' as _i5;
import 'package:hostel_manager/app/pages/booking/selected_booking_room_view.dart'
    as _i11;
import 'package:hostel_manager/app/pages/main/main_view.dart' as _i7;
import 'package:hostel_manager/app/pages/news/news_view.dart' as _i8;
import 'package:hostel_manager/app/pages/news/selected_news_view.dart' as _i12;
import 'package:hostel_manager/app/pages/onboarding/onboarding_view.dart'
    as _i9;
import 'package:hostel_manager/app/pages/rooms/add_room.dart' as _i2;
import 'package:hostel_manager/app/pages/rooms/filters_view.dart' as _i6;
import 'package:hostel_manager/app/pages/rooms/rooms_view.dart' as _i10;
import 'package:hostel_manager/app/pages/rooms/selected_room_view.dart' as _i13;
import 'package:hostel_manager/app/pages/settings/settings_view.dart' as _i14;
import 'package:hostel_manager/app/pages/spalsh/splash_view.dart' as _i15;
import 'package:hostel_manager/app/pages/tasks/add_task_view.dart' as _i3;
import 'package:hostel_manager/app/pages/tasks/tasks_view.dart' as _i16;

abstract class $AppRouter extends _i17.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    AddBooking.name: (routeData) {
      final args = routeData.argsAs<AddBookingArgs>(
          orElse: () => const AddBookingArgs());
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddBooking(
          key: args.key,
          room: args.room,
        ),
      );
    },
    AddRoom.name: (routeData) {
      final args =
          routeData.argsAs<AddRoomArgs>(orElse: () => const AddRoomArgs());
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AddRoom(
          key: args.key,
          roomKey: args.roomKey,
        ),
      );
    },
    AddTaskView.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AddTaskView(),
      );
    },
    BookingView.name: (routeData) {
      final args = routeData.argsAs<BookingViewArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.BookingView(
          bookingKey: args.bookingKey,
          key: args.key,
        ),
      );
    },
    CalendarView.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.CalendarView(),
      );
    },
    FiltersView.name: (routeData) {
      final args = routeData.argsAs<FiltersViewArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.FiltersView(
          booking: args.booking,
          key: args.key,
        ),
      );
    },
    MainView.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.MainView(),
      );
    },
    NewsView.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.NewsView(),
      );
    },
    OnBoardingView.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.OnBoardingView(),
      );
    },
    RoomsView.name: (routeData) {
      final args =
          routeData.argsAs<RoomsViewArgs>(orElse: () => const RoomsViewArgs());
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.RoomsView(
          key: args.key,
          booking: args.booking,
        ),
      );
    },
    SelectedBookingRoomView.name: (routeData) {
      final args = routeData.argsAs<SelectedBookingRoomViewArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.SelectedBookingRoomView(
          roomKey: args.roomKey,
          key: args.key,
        ),
      );
    },
    SelectedNewsView.name: (routeData) {
      final args = routeData.argsAs<SelectedNewsViewArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.SelectedNewsView(
          news: args.news,
          key: args.key,
        ),
      );
    },
    SelectedRoomView.name: (routeData) {
      final args = routeData.argsAs<SelectedRoomViewArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.SelectedRoomView(
          roomKey: args.roomKey,
          key: args.key,
        ),
      );
    },
    SettingsView.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.SettingsView(),
      );
    },
    SplashView.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.SplashView(),
      );
    },
    TasksView.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.TasksView(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddBooking]
class AddBooking extends _i17.PageRouteInfo<AddBookingArgs> {
  AddBooking({
    _i18.Key? key,
    _i19.Room? room,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          AddBooking.name,
          args: AddBookingArgs(
            key: key,
            room: room,
          ),
          initialChildren: children,
        );

  static const String name = 'AddBooking';

  static const _i17.PageInfo<AddBookingArgs> page =
      _i17.PageInfo<AddBookingArgs>(name);
}

class AddBookingArgs {
  const AddBookingArgs({
    this.key,
    this.room,
  });

  final _i18.Key? key;

  final _i19.Room? room;

  @override
  String toString() {
    return 'AddBookingArgs{key: $key, room: $room}';
  }
}

/// generated route for
/// [_i2.AddRoom]
class AddRoom extends _i17.PageRouteInfo<AddRoomArgs> {
  AddRoom({
    _i18.Key? key,
    int? roomKey,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          AddRoom.name,
          args: AddRoomArgs(
            key: key,
            roomKey: roomKey,
          ),
          initialChildren: children,
        );

  static const String name = 'AddRoom';

  static const _i17.PageInfo<AddRoomArgs> page =
      _i17.PageInfo<AddRoomArgs>(name);
}

class AddRoomArgs {
  const AddRoomArgs({
    this.key,
    this.roomKey,
  });

  final _i18.Key? key;

  final int? roomKey;

  @override
  String toString() {
    return 'AddRoomArgs{key: $key, roomKey: $roomKey}';
  }
}

/// generated route for
/// [_i3.AddTaskView]
class AddTaskView extends _i17.PageRouteInfo<void> {
  const AddTaskView({List<_i17.PageRouteInfo>? children})
      : super(
          AddTaskView.name,
          initialChildren: children,
        );

  static const String name = 'AddTaskView';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i4.BookingView]
class BookingView extends _i17.PageRouteInfo<BookingViewArgs> {
  BookingView({
    required int bookingKey,
    _i18.Key? key,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          BookingView.name,
          args: BookingViewArgs(
            bookingKey: bookingKey,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'BookingView';

  static const _i17.PageInfo<BookingViewArgs> page =
      _i17.PageInfo<BookingViewArgs>(name);
}

class BookingViewArgs {
  const BookingViewArgs({
    required this.bookingKey,
    this.key,
  });

  final int bookingKey;

  final _i18.Key? key;

  @override
  String toString() {
    return 'BookingViewArgs{bookingKey: $bookingKey, key: $key}';
  }
}

/// generated route for
/// [_i5.CalendarView]
class CalendarView extends _i17.PageRouteInfo<void> {
  const CalendarView({List<_i17.PageRouteInfo>? children})
      : super(
          CalendarView.name,
          initialChildren: children,
        );

  static const String name = 'CalendarView';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i6.FiltersView]
class FiltersView extends _i17.PageRouteInfo<FiltersViewArgs> {
  FiltersView({
    required bool booking,
    _i18.Key? key,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          FiltersView.name,
          args: FiltersViewArgs(
            booking: booking,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'FiltersView';

  static const _i17.PageInfo<FiltersViewArgs> page =
      _i17.PageInfo<FiltersViewArgs>(name);
}

class FiltersViewArgs {
  const FiltersViewArgs({
    required this.booking,
    this.key,
  });

  final bool booking;

  final _i18.Key? key;

  @override
  String toString() {
    return 'FiltersViewArgs{booking: $booking, key: $key}';
  }
}

/// generated route for
/// [_i7.MainView]
class MainView extends _i17.PageRouteInfo<void> {
  const MainView({List<_i17.PageRouteInfo>? children})
      : super(
          MainView.name,
          initialChildren: children,
        );

  static const String name = 'MainView';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i8.NewsView]
class NewsView extends _i17.PageRouteInfo<void> {
  const NewsView({List<_i17.PageRouteInfo>? children})
      : super(
          NewsView.name,
          initialChildren: children,
        );

  static const String name = 'NewsView';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i9.OnBoardingView]
class OnBoardingView extends _i17.PageRouteInfo<void> {
  const OnBoardingView({List<_i17.PageRouteInfo>? children})
      : super(
          OnBoardingView.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingView';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i10.RoomsView]
class RoomsView extends _i17.PageRouteInfo<RoomsViewArgs> {
  RoomsView({
    _i18.Key? key,
    bool booking = false,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          RoomsView.name,
          args: RoomsViewArgs(
            key: key,
            booking: booking,
          ),
          initialChildren: children,
        );

  static const String name = 'RoomsView';

  static const _i17.PageInfo<RoomsViewArgs> page =
      _i17.PageInfo<RoomsViewArgs>(name);
}

class RoomsViewArgs {
  const RoomsViewArgs({
    this.key,
    this.booking = false,
  });

  final _i18.Key? key;

  final bool booking;

  @override
  String toString() {
    return 'RoomsViewArgs{key: $key, booking: $booking}';
  }
}

/// generated route for
/// [_i11.SelectedBookingRoomView]
class SelectedBookingRoomView
    extends _i17.PageRouteInfo<SelectedBookingRoomViewArgs> {
  SelectedBookingRoomView({
    required int roomKey,
    _i18.Key? key,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          SelectedBookingRoomView.name,
          args: SelectedBookingRoomViewArgs(
            roomKey: roomKey,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SelectedBookingRoomView';

  static const _i17.PageInfo<SelectedBookingRoomViewArgs> page =
      _i17.PageInfo<SelectedBookingRoomViewArgs>(name);
}

class SelectedBookingRoomViewArgs {
  const SelectedBookingRoomViewArgs({
    required this.roomKey,
    this.key,
  });

  final int roomKey;

  final _i18.Key? key;

  @override
  String toString() {
    return 'SelectedBookingRoomViewArgs{roomKey: $roomKey, key: $key}';
  }
}

/// generated route for
/// [_i12.SelectedNewsView]
class SelectedNewsView extends _i17.PageRouteInfo<SelectedNewsViewArgs> {
  SelectedNewsView({
    required _i20.News news,
    _i18.Key? key,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          SelectedNewsView.name,
          args: SelectedNewsViewArgs(
            news: news,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SelectedNewsView';

  static const _i17.PageInfo<SelectedNewsViewArgs> page =
      _i17.PageInfo<SelectedNewsViewArgs>(name);
}

class SelectedNewsViewArgs {
  const SelectedNewsViewArgs({
    required this.news,
    this.key,
  });

  final _i20.News news;

  final _i18.Key? key;

  @override
  String toString() {
    return 'SelectedNewsViewArgs{news: $news, key: $key}';
  }
}

/// generated route for
/// [_i13.SelectedRoomView]
class SelectedRoomView extends _i17.PageRouteInfo<SelectedRoomViewArgs> {
  SelectedRoomView({
    required int roomKey,
    _i18.Key? key,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          SelectedRoomView.name,
          args: SelectedRoomViewArgs(
            roomKey: roomKey,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SelectedRoomView';

  static const _i17.PageInfo<SelectedRoomViewArgs> page =
      _i17.PageInfo<SelectedRoomViewArgs>(name);
}

class SelectedRoomViewArgs {
  const SelectedRoomViewArgs({
    required this.roomKey,
    this.key,
  });

  final int roomKey;

  final _i18.Key? key;

  @override
  String toString() {
    return 'SelectedRoomViewArgs{roomKey: $roomKey, key: $key}';
  }
}

/// generated route for
/// [_i14.SettingsView]
class SettingsView extends _i17.PageRouteInfo<void> {
  const SettingsView({List<_i17.PageRouteInfo>? children})
      : super(
          SettingsView.name,
          initialChildren: children,
        );

  static const String name = 'SettingsView';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i15.SplashView]
class SplashView extends _i17.PageRouteInfo<void> {
  const SplashView({List<_i17.PageRouteInfo>? children})
      : super(
          SplashView.name,
          initialChildren: children,
        );

  static const String name = 'SplashView';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i16.TasksView]
class TasksView extends _i17.PageRouteInfo<void> {
  const TasksView({List<_i17.PageRouteInfo>? children})
      : super(
          TasksView.name,
          initialChildren: children,
        );

  static const String name = 'TasksView';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}
