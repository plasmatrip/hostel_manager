import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

Future<DateTime?> dateDialog(BuildContext context, DateTime? selectedDate, [bool showEvents = false]) {
  const monthName = ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'];
  selectedDate ??= DateTime.now();

  return showDialog<DateTime>(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.h)),
            backgroundColor: bg,
            surfaceTintColor: bg,
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
            clipBehavior: Clip.none,
            content: SizedBox(
              width: 308.w,
              height: 320.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TableCalendar(
                    locale: 'ru',
                    focusedDay: selectedDate!,
                    firstDay: DateTime(2010, 1, 1),
                    lastDay: DateTime(2035, 1, 1),
                    rowHeight: 30.h,
                    weekNumbersVisible: false,
                    calendarFormat: CalendarFormat.month,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    calendarStyle: CalendarStyle(
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
                      todayDecoration: ShapeDecoration(
                        shape: CircleBorder(
                          side: BorderSide(color: colorsAcc, width: 1.h),
                        ),
                      ),
                      weekendTextStyle: context.s12w300.copyWith(color: greyDark),
                      outsideTextStyle: context.s12w300.copyWith(color: greyLight),
                    ),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        selectedDate = selectedDay;
                      });
                    },
                    selectedDayPredicate: (day) {
                      return isSameDay(selectedDate, day);
                    },
                    headerStyle: HeaderStyle(
                      titleTextFormatter: (date, locale) => '${monthName[date.month - 1]} ${DateFormat.y('ru').format(date)}',
                      titleCentered: true,
                      headerPadding: EdgeInsets.zero,
                      headerMargin: EdgeInsets.zero,
                      formatButtonVisible: false,
                      rightChevronMargin: EdgeInsets.zero,
                      leftChevronMargin: EdgeInsets.zero,
                      titleTextStyle: context.s16w400.copyWith(color: const Color(0xFF315223)),
                      leftChevronIcon: Icon(Icons.arrow_back_ios, color: greyGrey, size: 24.h),
                      rightChevronIcon: Icon(Icons.arrow_forward_ios, color: colorsAcc, size: 24.h),
                    ),
                    daysOfWeekHeight: 20.h,
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: context.s10w300.copyWith(color: greyGrey),
                      weekendStyle: context.s10w300.copyWith(color: greyGrey),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FilledButton(
                        onPressed: () => AutoRouter.of(context).maybePop(),
                        style: context.btnCanel,
                        child: const Text('Закрыть'),
                      ),
                      FilledButton(
                        onPressed: () => AutoRouter.of(context).maybePop(selectedDate),
                        style: context.btnOk,
                        child: const Text('Выбрать'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
