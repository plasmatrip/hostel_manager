import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';

class EmptyTasks extends StatelessWidget {
  const EmptyTasks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Нет задач на сегодня',
          style: context.s12w400.copyWith(color: greyGrey),
        ),
        SizedBox(height: 12.h),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {},
          child: Text(
            'Открыть календарь',
            style: context.textUnderline,
          ),
        ),
      ],
    );
  }
}
