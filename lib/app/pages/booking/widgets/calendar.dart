import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/repository/booking_repo.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  const Calendar({
    required this.bookedDays,
    super.key,
  });

  final Map<int, bool> bookedDays;

  @override
  Widget build(BuildContext context) {
    //Map<int, bool> bookedDays = context.watch<BookingRepo>().bookedDays(roomKey);
    return Container(
      width: 375.w,
      height: 240.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        shadows: [
          BoxShadow(
            color: const Color(0x3FABB1B9),
            blurRadius: 12.h,
            offset: Offset(0, 2.h),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 135.w,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        context.read<BookingRepo>().selectedMonth =
                            Jiffy.parseFromDateTime(context.read<BookingRepo>().selectedMonth).subtract(months: 1).dateTime;
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: greyGrey,
                        size: 24.h,
                      ),
                    ),
                    Text(
                      monthName[context.read<BookingRepo>().selectedMonth.month - 1],
                      style: context.s16w400.copyWith(color: greyDark),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        context.read<BookingRepo>().selectedMonth = Jiffy.parseFromDateTime(context.read<BookingRepo>().selectedMonth).add(months: 1).dateTime;
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
                DateFormat('y', 'ru').format(context.read<BookingRepo>().selectedMonth),
                style: context.s14w300.copyWith(color: greyGrey),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          TableCalendar(
            locale: 'ru',
            focusedDay: context.watch<BookingRepo>().selectedMonth,
            firstDay: DateTime(2010, 1, 1),
            lastDay: DateTime(2035, 1, 1),
            rowHeight: 24.h,
            weekNumbersVisible: false,
            calendarFormat: CalendarFormat.month,
            startingDayOfWeek: StartingDayOfWeek.monday,
            onPageChanged: (focusedDay) {
              context.read<BookingRepo>().selectedMonth = focusedDay;
            },
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                if (bookedDays.containsKey(day.day)) {
                  return Center(
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: const ShapeDecoration(
                        color: colors_3,
                        shape: CircleBorder(),
                      ),
                      child: Center(
                        child: Text(
                          day.day.toString(),
                          style: context.s12w400.copyWith(color: greyDark),
                        ),
                      ),
                    ),
                  );
                }
                return Center(
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: const ShapeDecoration(
                      color: bg,
                      shape: CircleBorder(),
                    ),
                    child: Center(
                      child: Text(
                        day.day.toString(),
                        style: context.s12w400.copyWith(color: greyDark),
                      ),
                    ),
                  ),
                );
              },
              todayBuilder: (context, day, focusedDay) {
                if (bookedDays.containsKey(day.day)) {
                  return Center(
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: const ShapeDecoration(
                        color: colors_3,
                        shape: CircleBorder(),
                      ),
                      child: Center(
                        child: Text(
                          day.day.toString(),
                          style: context.s12w400.copyWith(color: greyDark),
                        ),
                      ),
                    ),
                  );
                }
                return Center(
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: const ShapeDecoration(
                      color: bg,
                      shape: CircleBorder(),
                    ),
                    child: Center(
                      child: Text(
                        day.day.toString(),
                        style: context.s12w400.copyWith(color: greyDark),
                      ),
                    ),
                  ),
                );
              },
            ),
            calendarStyle: CalendarStyle(
              rowDecoration: BoxDecoration(border: Border(bottom: BorderSide(color: greyLight, width: 0.2.h))),
              cellAlignment: Alignment.center,
              cellMargin: EdgeInsets.zero,
              cellPadding: EdgeInsets.zero,
              outsideDaysVisible: true,
              defaultTextStyle: context.s12w300.copyWith(color: greyDark),
              selectedTextStyle: context.s12w300.copyWith(color: bg),
              selectedDecoration: const BoxDecoration(
                color: colorsAcc,
                shape: BoxShape.circle,
              ),
              todayTextStyle: context.s12w300.copyWith(color: greyDark),
              todayDecoration: const BoxDecoration(),
              weekendTextStyle: context.s12w300.copyWith(color: greyDark),
              outsideTextStyle: context.s12w300.copyWith(color: greyLight),
            ),
            headerVisible: false,
            daysOfWeekHeight: 20.h,
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: context.s10w300.copyWith(color: greyGrey),
              weekendStyle: context.s10w300.copyWith(color: greyGrey),
            ),
          ),
        ],
      ),
    );
  }
}
