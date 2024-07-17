import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';

class FreeRoomPin extends StatelessWidget {
  const FreeRoomPin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 12.w,
      top: -9.h,
      child: Container(
        height: 18.h,
        padding: EdgeInsets.symmetric(horizontal: 12.h),
        decoration: ShapeDecoration(
          color: colors_1,
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
        child: Center(
          child: Text(
            'Свободен',
            style: context.s8w500.copyWith(color: greyDark),
          ),
        ),
      ),
    );
  }
}
