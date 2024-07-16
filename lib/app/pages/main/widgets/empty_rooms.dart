import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';

class EmptyRooms extends StatelessWidget {
  const EmptyRooms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      height: 136.h,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Данные о номерах отсутствуют',
            style: context.s12w400.copyWith(color: greyGrey),
          ),
          SizedBox(height: 12.h),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {},
            child: Text(
              'Добавить номера',
              style: context.textUnderline,
            ),
          )
        ],
      ),
    );
  }
}
