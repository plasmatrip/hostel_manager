import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/internal/utils.dart';
import 'package:intl/intl.dart';

class DayItem extends StatelessWidget {
  const DayItem({
    required this.date,
    required this.isSelected,
    super.key,
    this.onTap,
  });

  final DateTime date;
  final bool isSelected;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    return Container(
      width: 37.w,
      height: 47.h,
      decoration: isSelected
          ? ShapeDecoration(
              color: colorsAcc,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.h)),
              shadows: [
                BoxShadow(
                  color: const Color(0x3FABB1B9),
                  blurRadius: 12.h,
                  offset: Offset(0, 2.h),
                  spreadRadius: 0,
                )
              ],
            )
          : datesIsEqual(date, now)
              ? ShapeDecoration(
                  color: bg,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: colorsAcc, width: 1.h),
                    borderRadius: BorderRadius.circular(8.h),
                  ),
                )
              : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 2.h),
          Text(
            DateFormat('E', 'ru').format(date),
            style: isSelected
                ? context.s10w300.copyWith(color: greyGrey)
                : date.weekday == DateTime.saturday || date.weekday == DateTime.sunday
                    ? context.s10w400.copyWith(color: colorsRed)
                    : context.s10w400.copyWith(color: greyGrey),
          ),
          SizedBox(height: 2.h),
          Text(
            date.day.toString(),
            style: isSelected ? context.s14w400.copyWith(color: bg) : context.s13w400.copyWith(color: greyDark),
          ),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }
}
