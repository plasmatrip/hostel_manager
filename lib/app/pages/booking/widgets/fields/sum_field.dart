import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/repository/booking_repo.dart';
import 'package:provider/provider.dart';

class SumField extends StatelessWidget {
  const SumField({
    super.key,
  });

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
              Text('Сумма, руб', style: context.s14w400.copyWith(color: greyGrey)),
              SizedBox(height: 6.h),
              Padding(
                padding: EdgeInsets.only(left: 14.w),
                child: context.watch<BookingRepo>().sum == 0
                    ? Text(
                        'Сумма к оплате',
                        style: context.s13w200.copyWith(color: greyGrey),
                      )
                    : Text(
                        context.read<BookingRepo>().sum.toString(),
                        style: context.s13w400.copyWith(color: greyDark),
                      ),
              ),
              Divider(color: greyGrey, thickness: 0.3.h, height: 1.h),
            ],
          ),
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
