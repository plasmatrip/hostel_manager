import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';

extension UI on BuildContext {
  TextStyle get s32w600 => TextStyle(fontSize: 32.h, fontFamily: 'SF Pro Display', fontWeight: FontWeight.w600);
  TextStyle get s24w600 => TextStyle(fontSize: 24.h, fontFamily: 'SF Pro Display', fontWeight: FontWeight.w600);
  TextStyle get s24w500 => TextStyle(fontSize: 24.h, fontFamily: 'SF Pro Display', fontWeight: FontWeight.w500);
  TextStyle get s24w400 => TextStyle(fontSize: 24.h, fontFamily: 'SF Pro Display', fontWeight: FontWeight.w400);
  TextStyle get s22w400 => TextStyle(fontSize: 22.h, fontFamily: 'SF Pro Display', fontWeight: FontWeight.w400);
  TextStyle get s20w500 => TextStyle(fontSize: 20.h, fontFamily: 'SF Pro Display', fontWeight: FontWeight.w500);
  TextStyle get s17w500 => TextStyle(fontSize: 17.h, fontFamily: 'SF Pro Display', fontWeight: FontWeight.w500);
  TextStyle get s17w400 => TextStyle(fontSize: 17.h, fontFamily: 'SF Pro Display', fontWeight: FontWeight.w400);
  TextStyle get s16w500 => TextStyle(fontSize: 16.h, fontFamily: 'SF Pro Display', fontWeight: FontWeight.w500);
  TextStyle get s16w400 => TextStyle(fontSize: 16.h, fontFamily: 'SF Pro Display', fontWeight: FontWeight.w400);
  TextStyle get s16w300 => TextStyle(fontSize: 16.h, fontFamily: 'SF Pro Display', fontWeight: FontWeight.w300);
  TextStyle get s15w500 => TextStyle(fontSize: 15.h, fontFamily: 'SF Pro Display', fontWeight: FontWeight.w500);
  TextStyle get s15w400 => TextStyle(fontSize: 15.h, fontFamily: 'SF Pro Display', fontWeight: FontWeight.w400);
  TextStyle get s14w500 => TextStyle(fontSize: 14.h, fontFamily: 'SF Pro Display', fontWeight: FontWeight.w500);
  TextStyle get s14w400 => TextStyle(fontSize: 14.h, fontFamily: 'SF Pro Display', fontWeight: FontWeight.w400);
  TextStyle get s14w300 => TextStyle(fontSize: 14.h, fontFamily: 'SF Pro Display', fontWeight: FontWeight.w300);
  TextStyle get s13w500 => TextStyle(fontSize: 13.h, fontFamily: 'SF Pro Display', fontWeight: FontWeight.w500);
  TextStyle get s13w400 => TextStyle(fontSize: 13.h, fontFamily: 'SF Pro Display', fontWeight: FontWeight.w400);
  TextStyle get s13w300 => TextStyle(fontSize: 13.h, fontFamily: 'SF Pro Display', fontWeight: FontWeight.w300);
  TextStyle get s13w200 => TextStyle(fontSize: 13.h, fontFamily: 'SF Pro Display', fontWeight: FontWeight.w200);
  TextStyle get s12w400 => TextStyle(fontSize: 12.h, fontFamily: 'SF Pro Display', fontWeight: FontWeight.w400);
  TextStyle get s12w300 => TextStyle(fontSize: 12.h, fontFamily: 'SF Pro Display', fontWeight: FontWeight.w300);
  TextStyle get s10w600 => TextStyle(fontSize: 10.h, fontFamily: 'SF Pro Display', fontWeight: FontWeight.w600);
  TextStyle get s10w400 => TextStyle(fontSize: 10.h, fontFamily: 'SF Pro Display', fontWeight: FontWeight.w400);
  TextStyle get s10w300 => TextStyle(fontSize: 10.h, fontFamily: 'SF Pro Display', fontWeight: FontWeight.w300);
  TextStyle get s8w500 => TextStyle(fontSize: 8.h, fontFamily: 'SF Pro Display', fontWeight: FontWeight.w500);

  ButtonStyle get btnCanel => FilledButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        backgroundColor: bg,
        foregroundColor: colorsAcc,
        minimumSize: Size(118.w, 26.h),
        maximumSize: Size(118.w, 26.h),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.h, color: colorsAcc),
          borderRadius: BorderRadius.circular(8.h),
        ),
        textStyle: s14w400,
      );
  ButtonStyle get btnOk => FilledButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        backgroundColor: colorsAcc,
        foregroundColor: Colors.white,
        minimumSize: Size(118.w, 26.h),
        maximumSize: Size(118.w, 26.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
        textStyle: s14w400,
      );
  ButtonStyle get extraBtn => FilledButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        backgroundColor: colorsAcc,
        foregroundColor: Colors.white,
        disabledBackgroundColor: greyGrey,
        disabledForegroundColor: greyLight,
        minimumSize: Size(335.w, 40.h),
        maximumSize: Size(335.w, 40.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
        textStyle: s17w500,
      );
}
