import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hostel_manager/app/internal/colors.dart';

class AddRoomButton extends StatelessWidget {
  const AddRoomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32.h,
      height: 32.h,
      padding: EdgeInsets.all(4.h),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: bg,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.h),
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
      child: SvgPicture.asset('assets/icons/Add Circle.svg', width: 24.h, height: 24.h),
    );
  }
}
