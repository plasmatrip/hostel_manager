import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/models/task.dart';
import 'package:hostel_manager/app/pages/main/widgets/task_item.dart';
import 'package:hostel_manager/app/repository/task_repo.dart';
import 'package:hostel_manager/app/routing/app_router.gr.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    Iterable today = context.watch<TaskRepo>().taskByDate((DateTime.now()));
    Iterable tomorrow = context.watch<TaskRepo>().taskByDate((DateTime.now().add(const Duration(days: 1))));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat('Сегодня, d MMMM', 'ru').format(DateTime.now()),
          style: context.s12w400.copyWith(color: greyGrey),
        ),
        SizedBox(height: 12.h),
        if (today.isNotEmpty) ...[
          SizedBox(
            height: 152.h,
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: today.length,
              separatorBuilder: (context, index) => SizedBox(
                height: 12.h,
              ),
              itemBuilder: (context, index) {
                Task task = today.elementAt(index);
                return TaskItem(task: task);
              },
            ),
          ),
        ] else ...[
          Center(
            child: Text(
              'Нет задач на сегодня',
              style: context.s12w400.copyWith(color: greyGrey),
            ),
          ),
        ],
        SizedBox(height: 12.h),
        Text(
          DateFormat('Завтра, d MMMM', 'ru').format(DateTime.now().add(const Duration(days: 1))),
          style: context.s12w400.copyWith(color: greyGrey),
        ),
        SizedBox(height: 12.h),
        if (tomorrow.isNotEmpty) ...[
          SizedBox(
            height: 82.h,
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: tomorrow.length,
              separatorBuilder: (context, index) => SizedBox(
                height: 12.h,
              ),
              itemBuilder: (context, index) {
                Task task = tomorrow.elementAt(index);
                return TaskItem(task: task);
              },
            ),
          ),
        ] else ...[
          Center(
            child: Text(
              'Нет задач на завтра',
              style: context.s12w400.copyWith(color: greyGrey),
            ),
          ),
        ],
        SizedBox(height: 12.h),
        Center(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () async => AutoRouter.of(context).push(const TasksView()),
            child: Text(
              'Все задачи',
              style: context.textUnderline,
            ),
          ),
        ),
      ],
    );
  }
}
