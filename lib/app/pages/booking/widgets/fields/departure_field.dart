import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/internal/widgets/date_dialog.dart';
import 'package:hostel_manager/app/repository/booking_repo.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DepartureField extends StatelessWidget {
  const DepartureField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async {
            var result = await dateDialog(context, context.read<BookingRepo>().departure);
            if (result != null && context.mounted) {
              context.read<BookingRepo>().departure = result;
            }
          },
          child: Container(
            width: 165.w,
            height: 48.h,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                context.watch<BookingRepo>().departure == null
                    ? Text(
                        'Дата выезда',
                        style: context.s14w400.copyWith(color: greyGrey),
                      )
                    : Text(
                        DateFormat('dd.MM.y', 'ru').format(context.read<BookingRepo>().departure!),
                        style: context.s13w400.copyWith(color: greyDark),
                      ),
                SvgPicture.asset(
                  'assets/icons/Calendar.svg',
                  width: 24.w,
                  height: 24.h,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
