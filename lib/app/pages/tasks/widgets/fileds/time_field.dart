import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/internal/widgets/time_dialog.dart';
import 'package:hostel_manager/app/repository/task_repo.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TimeField extends StatelessWidget {
  const TimeField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async {
            var time = await timeDialog(context, context.read<TaskRepo>().time);
            if (time != null && context.mounted) {
              context.read<TaskRepo>().time = time;
            }
          },
          child: Container(
            width: 335.w,
            height: 77.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            decoration: ShapeDecoration(
              color: bg,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 0.1.h, color: greyGrey),
                borderRadius: BorderRadius.circular(8.h),
              ),
              shadows: [
                BoxShadow(
                  color: const Color(0x3FABB1B9),
                  blurRadius: 12.h,
                  offset: Offset(0, 2.h),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Время', style: context.s14w400.copyWith(color: greyGrey)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    context.watch<TaskRepo>().time == null
                        ? Text(
                            'Время',
                            style: context.s13w200.copyWith(color: greyGrey),
                          )
                        : Text(
                            DateFormat('HH:mm', 'ru').format(context.read<TaskRepo>().time!),
                            style: context.s13w400.copyWith(color: greyDark),
                          ),
                    SvgPicture.asset(
                      'assets/icons/Calendar.svg',
                      width: 24.w,
                      height: 24.h,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
