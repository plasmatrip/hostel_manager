import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/pages/main/widgets/app_title.dart';
import 'package:hostel_manager/app/pages/main/widgets/news_list.dart';
import 'package:hostel_manager/app/pages/main/widgets/rooms_info.dart';
import 'package:hostel_manager/app/pages/main/widgets/rooms_list.dart';
import 'package:hostel_manager/app/pages/main/widgets/tasks_list.dart';

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
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 57.h, bottom: 92.h),
              child: Column(
                children: [
                  const AppTitle(),
                  SizedBox(height: 20.h),
                  const RoomsInfo(),
                  SizedBox(height: 20.h),
                  const RoomsList(),
                  SizedBox(height: 20.h),
                  const TasksList(),
                  SizedBox(height: 20.h),
                  const NewsList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
