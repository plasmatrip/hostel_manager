import 'package:auto_route/auto_route.dart';
import 'package:hostel_manager/app/routing/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Route,Page|Screen")
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(initial: true, page: SplashView.page),
        AutoRoute(page: OnBoardingView.page),
        AutoRoute(page: MainView.page),
        AutoRoute(page: SettingsView.page),
        AutoRoute(page: NewsView.page),
        AutoRoute(page: SelectedNewsView.page),
      ];
}
