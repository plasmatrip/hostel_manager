import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/repository/task_repo.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DayCalendar extends StatelessWidget {
  const DayCalendar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => context.read<TaskRepo>().selectedDate = context.read<TaskRepo>().selectedDate.subtract(const Duration(days: 1)),
          child: SvgPicture.asset('assets/icons/Square Alt Arrow Left.svg', width: 24.w, height: 24.h),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              DateFormat('dd MMMM y', 'ru').format(context.watch<TaskRepo>().selectedDate),
              style: context.s17w500.copyWith(color: greyDark),
            ),
            Text(
              DateFormat('EEEE', 'ru').format(context.watch<TaskRepo>().selectedDate),
              style: context.s12w300.copyWith(color: greyGrey),
            ),
          ],
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => context.read<TaskRepo>().selectedDate = context.read<TaskRepo>().selectedDate.add(const Duration(days: 1)),
          child: SvgPicture.asset('assets/icons/Square Alt Arrow Right.svg', width: 24.w, height: 24.h),
        ),
      ],
    );
  }
}
