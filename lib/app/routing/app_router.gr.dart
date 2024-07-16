// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i9;
import 'package:hostel_manager/app/models/news.dart' as _i8;
import 'package:hostel_manager/app/pages/main/main_view.dart' as _i1;
import 'package:hostel_manager/app/pages/news/news_view.dart' as _i2;
import 'package:hostel_manager/app/pages/news/selected_news_view.dart' as _i4;
import 'package:hostel_manager/app/pages/onboarding/onboarding_view.dart'
    as _i3;
import 'package:hostel_manager/app/pages/settings/settings_view.dart' as _i5;
import 'package:hostel_manager/app/pages/spalsh/splash_view.dart' as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    MainView.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.MainView(),
      );
    },
    NewsView.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.NewsView(),
      );
    },
    OnBoardingView.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.OnBoardingView(),
      );
    },
    SelectedNewsView.name: (routeData) {
      final args = routeData.argsAs<SelectedNewsViewArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.SelectedNewsView(
          news: args.news,
          key: args.key,
        ),
      );
    },
    SettingsView.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SettingsView(),
      );
    },
    SplashView.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SplashView(),
      );
    },
  };
}

/// generated route for
/// [_i1.MainView]
class MainView extends _i7.PageRouteInfo<void> {
  const MainView({List<_i7.PageRouteInfo>? children})
      : super(
          MainView.name,
          initialChildren: children,
        );

  static const String name = 'MainView';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.NewsView]
class NewsView extends _i7.PageRouteInfo<void> {
  const NewsView({List<_i7.PageRouteInfo>? children})
      : super(
          NewsView.name,
          initialChildren: children,
        );

  static const String name = 'NewsView';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.OnBoardingView]
class OnBoardingView extends _i7.PageRouteInfo<void> {
  const OnBoardingView({List<_i7.PageRouteInfo>? children})
      : super(
          OnBoardingView.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingView';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SelectedNewsView]
class SelectedNewsView extends _i7.PageRouteInfo<SelectedNewsViewArgs> {
  SelectedNewsView({
    required _i8.News news,
    _i9.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          SelectedNewsView.name,
          args: SelectedNewsViewArgs(
            news: news,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SelectedNewsView';

  static const _i7.PageInfo<SelectedNewsViewArgs> page =
      _i7.PageInfo<SelectedNewsViewArgs>(name);
}

class SelectedNewsViewArgs {
  const SelectedNewsViewArgs({
    required this.news,
    this.key,
  });

  final _i8.News news;

  final _i9.Key? key;

  @override
  String toString() {
    return 'SelectedNewsViewArgs{news: $news, key: $key}';
  }
}

/// generated route for
/// [_i5.SettingsView]
class SettingsView extends _i7.PageRouteInfo<void> {
  const SettingsView({List<_i7.PageRouteInfo>? children})
      : super(
          SettingsView.name,
          initialChildren: children,
        );

  static const String name = 'SettingsView';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SplashView]
class SplashView extends _i7.PageRouteInfo<void> {
  const SplashView({List<_i7.PageRouteInfo>? children})
      : super(
          SplashView.name,
          initialChildren: children,
        );

  static const String name = 'SplashView';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
