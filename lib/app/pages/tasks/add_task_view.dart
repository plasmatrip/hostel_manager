import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/pages/tasks/widgets/fileds/date_field.dart';
import 'package:hostel_manager/app/pages/tasks/widgets/fileds/name_field.dart';
import 'package:hostel_manager/app/pages/tasks/widgets/fileds/note_field.dart';
import 'package:hostel_manager/app/pages/tasks/widgets/fileds/time_field.dart';
import 'package:hostel_manager/app/pages/tasks/widgets/save_button.dart';
import 'package:hostel_manager/app/repository/task_repo.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            context.read<TaskRepo>().clear();
            AutoRouter.of(context).removeLast();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: colorsAcc,
            size: 24.h,
          ),
        ),
        title: const Text('Новая задача'),
        backgroundColor: bg,
        surfaceTintColor: bg,
        shadowColor: const Color(0x3FABB1B9),
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.h, top: 32.h, bottom: 92.h),
          child: const Column(
            children: [
              NameField(),
              DateField(),
              TimeField(),
              NoteField(),
              SaveButton(),
            ],
          ),
        ),
      ),
    );
  }
}
