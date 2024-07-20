import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/pages/main/widgets/add_task_button.dart';
import 'package:hostel_manager/app/pages/main/widgets/empty_tasks.dart';
import 'package:hostel_manager/app/pages/main/widgets/tasks.dart';
import 'package:hostel_manager/app/repository/task_repo.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: ShapeDecoration(
        color: bg,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.1.h, color: greyGrey),
          borderRadius: BorderRadius.circular(8),
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
        children: [
          const AddTaskButton(),
          if (context.watch<TaskRepo>().repo.isEmpty) ...[
            const EmptyTasks(),
          ] else ...[
            const Tasks(),
          ],
        ],
      ),
    );
  }
}
