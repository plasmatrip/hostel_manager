import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/repository/room_repo.dart';
import 'package:provider/provider.dart';

class ToiletField extends StatelessWidget {
  const ToiletField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 335.w,
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
            children: [
              Text('Собственный туалет', style: context.s14w400.copyWith(color: greyGrey)),
              SizedBox(height: 6.h),
              Row(
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => context.read<RoomRepo>().toilet = true,
                    child: SizedBox(
                      height: 24.h,
                      width: 148.w,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            context.watch<RoomRepo>().toilet == null
                                ? 'assets/icons/Property 1=off-1.svg'
                                : context.read<RoomRepo>().toilet == true
                                    ? 'assets/icons/Property 1=on-1.svg'
                                    : 'assets/icons/Property 1=off-1.svg',
                            width: 24.h,
                            height: 24.h,
                          ),
                          SizedBox(width: 4.w),
                          Text('Есть', style: context.s13w500.copyWith(color: greyDark, letterSpacing: -0.7.w)),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => context.read<RoomRepo>().toilet = false,
                    child: SizedBox(
                      height: 24.h,
                      width: 148.w,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            context.read<RoomRepo>().toilet == null
                                ? 'assets/icons/Property 1=off-1.svg'
                                : context.read<RoomRepo>().toilet == false
                                    ? 'assets/icons/Property 1=on-1.svg'
                                    : 'assets/icons/Property 1=off-1.svg',
                            width: 24.h,
                            height: 24.h,
                          ),
                          SizedBox(width: 4.w),
                          Text('Нет', style: context.s13w500.copyWith(color: greyDark, letterSpacing: -0.7.w)),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
