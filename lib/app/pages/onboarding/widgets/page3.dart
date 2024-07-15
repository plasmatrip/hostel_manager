import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';

class Page3 extends StatelessWidget {
  const Page3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/images/ob3.png',
          width: 375.w,
          height: 812.h,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 24.h,
          child: Container(
            width: 335.w,
            height: 128.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            decoration: ShapeDecoration(
              color: bg,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 0.1.h, color: greyGrey),
                borderRadius: BorderRadius.circular(8.h),
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
                Text(
                  'Новости',
                  style: context.s24w400.copyWith(color: colorsAcc),
                ),
                const Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\u2022 ',
                      style: context.s14w400.copyWith(color: greyDark),
                    ),
                    Expanded(
                      child: Text(
                        'Новости из туристической сферы',
                        style: context.s14w400.copyWith(color: greyDark, letterSpacing: -0.7.w),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\u2022 ',
                      style: context.s14w400.copyWith(color: greyDark),
                    ),
                    Expanded(
                      child: Text(
                        'Будьте в курсе последних новостей и не упускайте важную информацию',
                        style: context.s14w400.copyWith(color: greyDark, letterSpacing: -0.7.w),
                      ),
                    )
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
