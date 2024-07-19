import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/booked_room_list.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/calendar_search_block.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/calendar_timeline.dart';
import 'package:hostel_manager/app/repository/room_repo.dart';
import 'package:hostel_manager/app/routing/app_router.gr.dart';
import 'package:provider/provider.dart';

@RoutePage()
class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => AutoRouter.of(context).removeLast(),
          child: Icon(
            Icons.arrow_back_ios,
            color: colorsAcc,
            size: 24.h,
          ),
        ),
        title: const Text('Календарь'),
        backgroundColor: bg,
        surfaceTintColor: bg,
        shadowColor: const Color(0x3FABB1B9),
        elevation: 10,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
        child: Column(
          children: [
            CalendarSearchBlock(width: 335.w),
            SizedBox(height: 20.h),
            const CalendarTimeline(),
            const BookedRoomList(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FilledButton(
        onPressed: context.watch<RoomRepo>().canBooked() ? () async => AutoRouter.of(context).push(AddBooking()) : null,
        style: context.extraBtn,
        child: const Text('Новое бронирование'),
      ),
    );
  }
}
