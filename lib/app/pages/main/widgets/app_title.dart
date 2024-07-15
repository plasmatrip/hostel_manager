import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/routing/app_router.gr.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'HostelManager',
          style: context.s32w600.copyWith(color: colorsAcc, height: 0),
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async => AutoRouter.of(context).push(const SettingsView()),
          child: Container(
            width: 38.w,
            height: 38.w,
            padding: EdgeInsets.all(7.w),
            decoration: ShapeDecoration(
              color: colorsAcc,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
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
            child: SvgPicture.asset(
              'assets/icons/Settings Minimalistic.svg',
              width: 24.w,
              height: 24.w,
            ),
          ),
        )
      ],
    );
  }
}
