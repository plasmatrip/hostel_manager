import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/repository/room_repo.dart';
import 'package:hostel_manager/app/repository/task_repo.dart';
import 'package:hostel_manager/app/routing/app_router.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final appRouter = AppRouter();

  @override
  void dispose() async {
    await Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => RoomRepo()),
          ChangeNotifierProvider(create: (context) => TaskRepo()),
        ],
        builder: (context, child) {
          return DevicePreview(
              enabled: !kReleaseMode,
              builder: (context) {
                return ScreenUtilInit(
                  designSize: const Size(375, 812),
                  builder: (context, child) {
                    return MaterialApp.router(
                      debugShowCheckedModeBanner: false,
                      title: 'Gifts',
                      localizationsDelegates: const [
                        GlobalMaterialLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate
                      ],
                      supportedLocales: const [Locale('ru', 'RU')],
                      theme: ThemeData(
                        scaffoldBackgroundColor: bg,
                        appBarTheme: AppBarTheme(
                          backgroundColor: bg,
                          centerTitle: true,
                          titleTextStyle: context.s17w500.copyWith(color: greyBlack),
                        ),
                        useMaterial3: true,
                      ),
                      routerConfig: appRouter.config(),
                    );
                  },
                );
              });
        });
  }
}
