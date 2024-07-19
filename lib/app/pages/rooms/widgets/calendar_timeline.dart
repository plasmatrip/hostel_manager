import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/day_item.dart';
import 'package:hostel_manager/app/repository/room_repo.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

class CalendarTimeline extends StatelessWidget {
  const CalendarTimeline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final EasyInfiniteDateTimelineController controller = EasyInfiniteDateTimelineController();
    return Container(
      width: 335.w,
      height: 107.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: ShapeDecoration(
        color: bg,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.h)),
        shadows: [
          BoxShadow(
            color: const Color(0x3FABB1B9),
            blurRadius: 12.h,
            offset: Offset(0, 2.h),
            spreadRadius: 0,
          )
        ],
      ),
      child: EasyInfiniteDateTimeLine(
        controller: controller,
        locale: 'ru',
        selectionMode: const SelectionMode.none(),
        firstDate: DateTime(2014, 1, 1),
        lastDate: DateTime(2034, 1, 1),
        focusDate: context.watch<RoomRepo>().selectedDate,
        onDateChange: (selectedDate) {
          context.read<RoomRepo>().selectedDate = selectedDate;
        },
        headerBuilder: (context, date) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 125.w,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            context.read<RoomRepo>().selectedDate = Jiffy.parseFromDateTime(context.read<RoomRepo>().selectedDate).subtract(months: 1).dateTime;
                            controller.animateToDate(context.read<RoomRepo>().selectedDate);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: greyGrey,
                            size: 24.h,
                          ),
                        ),
                        Text(
                          DateFormat('MMMM', 'ru').format(date),
                          style: context.s16w400.copyWith(color: greyDark),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            context.read<RoomRepo>().selectedDate = Jiffy.parseFromDateTime(context.read<RoomRepo>().selectedDate).add(months: 1).dateTime;
                            controller.animateToDate(context.read<RoomRepo>().selectedDate);
                          },
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: colorsAcc,
                            size: 24.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    DateFormat('y', 'ru').format(date),
                    style: context.s14w300.copyWith(color: greyGrey),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
            ],
          );
        },
        dayProps: EasyDayProps(
          width: 37.w,
          height: 47.h,
        ),
        // showTimelineHeader: false,
        itemBuilder: (context, date, isSelected, onTap) {
          return InkWell(
            onTap: onTap,
            child: DayItem(date: date, isSelected: isSelected, onTap: onTap),
          );
        },
      ),
    );
  }
}
