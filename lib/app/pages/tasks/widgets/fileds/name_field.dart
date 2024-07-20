import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/repository/task_repo.dart';
import 'package:provider/provider.dart';

class NameField extends StatefulWidget {
  const NameField({
    super.key,
  });

  @override
  State<NameField> createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: context.read<TaskRepo>().name);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 335.w,
          height: 77.h,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Название', style: context.s14w400.copyWith(color: greyGrey)),
              TextField(
                controller: controller,
                onChanged: (value) => context.read<TaskRepo>().name = value,
                style: context.s13w400.copyWith(color: greyDark),
                decoration: InputDecoration.collapsed(
                  border: InputBorder.none,
                  hintText: 'Название задачи',
                  hintStyle: context.s13w200.copyWith(color: greyGrey),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
