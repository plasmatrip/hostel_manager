import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/routing/app_router.gr.dart';
import 'package:intl/intl.dart';

class EmptyTasks extends StatelessWidget {
  const EmptyTasks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat('Сегодня, d MMMM', 'ru').format(DateTime.now()),
          style: context.s12w400.copyWith(color: greyGrey),
        ),
        SizedBox(height: 12.h),
        Center(
          child: Text(
            'Нет задач на сегодня',
            style: context.s12w400.copyWith(color: greyGrey),
          ),
        ),
        SizedBox(height: 12.h),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async => AutoRouter.of(context).push(const TasksView()),
          child: Center(
            child: Text(
              'Открыть календарь',
              style: context.textUnderline,
            ),
          ),
        ),
      ],
    );
  }
}
