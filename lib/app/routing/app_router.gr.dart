// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:hostel_manager/app/pages/main/main_view.dart' as _i1;
import 'package:hostel_manager/app/pages/onboarding/onboarding_view.dart'
    as _i2;
import 'package:hostel_manager/app/pages/settings/settings_view.dart' as _i3;
import 'package:hostel_manager/app/pages/spalsh/splash_view.dart' as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    MainView.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.MainView(),
      );
    },
    OnBoardingView.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.OnBoardingView(),
      );
    },
    SettingsView.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SettingsView(),
      );
    },
    SplashView.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashView(),
      );
    },
  };
}

/// generated route for
/// [_i1.MainView]
class MainView extends _i5.PageRouteInfo<void> {
  const MainView({List<_i5.PageRouteInfo>? children})
      : super(
          MainView.name,
          initialChildren: children,
        );

  static const String name = 'MainView';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.OnBoardingView]
class OnBoardingView extends _i5.PageRouteInfo<void> {
  const OnBoardingView({List<_i5.PageRouteInfo>? children})
      : super(
          OnBoardingView.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingView';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SettingsView]
class SettingsView extends _i5.PageRouteInfo<void> {
  const SettingsView({List<_i5.PageRouteInfo>? children})
      : super(
          SettingsView.name,
          initialChildren: children,
        );

  static const String name = 'SettingsView';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SplashView]
class SplashView extends _i5.PageRouteInfo<void> {
  const SplashView({List<_i5.PageRouteInfo>? children})
      : super(
          SplashView.name,
          initialChildren: children,
        );

  static const String name = 'SplashView';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
