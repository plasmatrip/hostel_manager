import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/models/task.dart';
import 'package:hostel_manager/app/pages/tasks/widgets/day_calendar.dart';
import 'package:hostel_manager/app/pages/tasks/widgets/task_item.dart';
import 'package:hostel_manager/app/repository/task_repo.dart';
import 'package:hostel_manager/app/routing/app_router.gr.dart';
import 'package:provider/provider.dart';

@RoutePage()
class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    Iterable tasks = context.watch<TaskRepo>().tasks();
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            AutoRouter.of(context).removeLast();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: colorsAcc,
            size: 24.h,
          ),
        ),
        title: const Text('Задачи'),
        backgroundColor: bg,
        surfaceTintColor: bg,
        shadowColor: const Color(0x3FABB1B9),
        elevation: 10,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const DayCalendar(),
            SizedBox(height: 16.h),
            ListView(
              shrinkWrap: true,
              children: [
                Container(
                  width: 335.w,
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: tasks.length,
                        separatorBuilder: (context, index) => SizedBox(height: 12.h),
                        itemBuilder: (context, index) {
                          Task task = tasks.elementAt(index);
                          return TaskItem(task: task);
                        },
                      ),
                      FilledButton(
                        onPressed: () async => AutoRouter.of(context).push(const AddTaskView()),
                        style: context.extraBtn.copyWith(
                          minimumSize: WidgetStatePropertyAll(Size(311.w, 26.h)),
                          maximumSize: WidgetStatePropertyAll(Size(311.w, 26.h)),
                        ),
                        child: Text(
                          'Добавить задачу',
                          style: context.s14w400.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
