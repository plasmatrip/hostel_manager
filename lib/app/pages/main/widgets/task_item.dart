import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/models/task.dart';
import 'package:hostel_manager/app/repository/task_repo.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    required this.task,
    super.key,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async => context.read<TaskRepo>().setTaskDone(task.key),
      child: SizedBox(
        width: 310.w,
        height: 70.h,
        child: IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(task.done ? 'assets/icons/Property 1=on.svg' : 'assets/icons/Property 1=off.svg'),
              VerticalDivider(color: colorsAcc, thickness: 0.5.w, width: 0.5.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 275.w,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          task.name,
                          style: context.s16w500.copyWith(color: greyBlack),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        SvgPicture.asset('assets/icons/Clock Circle.svg', width: 24.w, height: 24.h),
                        SizedBox(width: 6.w),
                        Text(DateFormat('HH:mm', 'ru').format(task.time!), style: context.s12w400.copyWith(color: greyDark)),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 275.w,
                    child: Text(
                      task.note,
                      style: context.s13w300.copyWith(color: greyGrey),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
