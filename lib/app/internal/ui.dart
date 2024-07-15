import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';

extension UI on BuildContext {
  TextStyle get s32w600 => TextStyle(fontSize: 32.h, fontFamily: 'Comfortaa', fontWeight: FontWeight.w600);
  TextStyle get s32w500 => TextStyle(fontSize: 32.h, fontFamily: 'Comfortaa', fontWeight: FontWeight.w500);
  TextStyle get s28w500 => TextStyle(fontSize: 28.h, fontFamily: 'Comfortaa', fontWeight: FontWeight.w500);
  TextStyle get s27w500 => TextStyle(fontSize: 27.h, fontFamily: 'Comfortaa', fontWeight: FontWeight.w500);
  TextStyle get s25w500 => TextStyle(fontSize: 25.h, fontFamily: 'Comfortaa', fontWeight: FontWeight.w500);
  TextStyle get s24w500 => TextStyle(fontSize: 24.h, fontFamily: 'Comfortaa', fontWeight: FontWeight.w500);
  TextStyle get s20w700 => TextStyle(fontSize: 20.h, fontFamily: 'Comfortaa', fontWeight: FontWeight.w700);
  TextStyle get s20w500 => TextStyle(fontSize: 20.h, fontFamily: 'Comfortaa', fontWeight: FontWeight.w500);
  TextStyle get s18w700 => TextStyle(fontSize: 18.h, fontFamily: 'Comfortaa', fontWeight: FontWeight.w700);
  TextStyle get s18w600 => TextStyle(fontSize: 18.h, fontFamily: 'Comfortaa', fontWeight: FontWeight.w600);
  TextStyle get s16w700 => TextStyle(fontSize: 16.h, fontFamily: 'Comfortaa', fontWeight: FontWeight.w700);
  TextStyle get s16w600 => TextStyle(fontSize: 16.h, fontFamily: 'Comfortaa', fontWeight: FontWeight.w600);
  TextStyle get s16w400 => TextStyle(fontSize: 16.h, fontFamily: 'Comfortaa', fontWeight: FontWeight.w400);
  TextStyle get s14w500 => TextStyle(fontSize: 14.h, fontFamily: 'Comfortaa', fontWeight: FontWeight.w500);
  TextStyle get s14w400 => TextStyle(fontSize: 14.h, fontFamily: 'Comfortaa', fontWeight: FontWeight.w400);
  TextStyle get s12w600 => TextStyle(fontSize: 12.h, fontFamily: 'Comfortaa', fontWeight: FontWeight.w600);
  TextStyle get s12w300 => TextStyle(fontSize: 12.h, fontFamily: 'Comfortaa', fontWeight: FontWeight.w300);

  TextStyle get s15w500i => TextStyle(fontSize: 15.h, fontFamily: 'Inter', fontWeight: FontWeight.w500);
  TextStyle get s14w600i => TextStyle(fontSize: 14.h, fontFamily: 'Inter', fontWeight: FontWeight.w600);
  TextStyle get s14w500i => TextStyle(fontSize: 14.h, fontFamily: 'Inter', fontWeight: FontWeight.w500);
  TextStyle get s14w400i => TextStyle(fontSize: 14.h, fontFamily: 'Inter', fontWeight: FontWeight.w400);
  TextStyle get s12w400i => TextStyle(fontSize: 12.h, fontFamily: 'Inter', fontWeight: FontWeight.w400);
  TextStyle get s9w400i => TextStyle(fontSize: 9.h, fontFamily: 'Inter', fontWeight: FontWeight.w400);
  TextStyle get s8w400i => TextStyle(fontSize: 8.h, fontFamily: 'Inter', fontWeight: FontWeight.w400);

  TextStyle get s11w400sf => TextStyle(fontSize: 11.h, fontFamily: 'SF Pro Display', fontWeight: FontWeight.w400);

  ButtonStyle get btnCanel => FilledButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        backgroundColor: bg,
        foregroundColor: greyDark,
        minimumSize: Size(118.w, 36.h),
        maximumSize: Size(118.w, 36.h),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.h, color: greyDark),
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: s16w600,
      );
  ButtonStyle get btnOk => FilledButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        backgroundColor: acc,
        foregroundColor: bg,
        minimumSize: Size(118.w, 36.h),
        maximumSize: Size(118.w, 36.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
        textStyle: s16w600,
      );
  ButtonStyle get extraBtn => FilledButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        backgroundColor: acc,
        foregroundColor: bg,
        disabledBackgroundColor: stroke,
        disabledForegroundColor: sec,
        minimumSize: Size(335.w, 46.h),
        maximumSize: Size(335.w, 46.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
        textStyle: s18w700,
      );
}
