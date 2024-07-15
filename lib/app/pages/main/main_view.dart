import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/pages/main/widgets/app_title.dart';
import 'package:hostel_manager/app/pages/main/widgets/rooms_info.dart';
import 'package:hostel_manager/app/pages/main/widgets/rooms_list.dart';

@RoutePage()
class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainView();
}

class _MainView extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 57.h),
              child: Column(
                children: [
                  const AppTitle(),
                  SizedBox(height: 20.h),
                  const RoomsInfo(),
                  SizedBox(height: 20.h),
                  const RoomsList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
