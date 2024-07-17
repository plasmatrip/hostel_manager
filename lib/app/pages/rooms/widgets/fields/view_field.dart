import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/repository/room_repo.dart';
import 'package:provider/provider.dart';

class ViewField extends StatelessWidget {
  const ViewField({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedView = context.watch<RoomRepo>().view == null ? -1 : context.watch<RoomRepo>().view!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 335.w,
          // height: 107.h,
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
              Text('Вид', style: context.s14w400.copyWith(color: greyGrey)),
              SizedBox(height: 6.h),
              Wrap(
                spacing: 16.w,
                runSpacing: 12.h,
                children: [
                  for (int i = 0; i < 4; i++) ...[
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        switch (i) {
                          case 0:
                            context.read<RoomRepo>().view = RoomView.sea.index;
                          case 1:
                            context.read<RoomRepo>().view = RoomView.garden.index;
                          case 2:
                            context.read<RoomRepo>().view = RoomView.city.index;
                          case 3:
                            context.read<RoomRepo>().view = RoomView.mall.index;
                        }
                      },
                      child: SizedBox(
                        height: 24.h,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              selectedView == i ? 'assets/icons/Property 1=on-1.svg' : 'assets/icons/Property 1=off-1.svg',
                              width: 24.h,
                              height: 24.h,
                            ),
                            SizedBox(width: 4.w),
                            Text(view[i], style: context.s13w500.copyWith(color: greyDark, letterSpacing: -0.7.w)),
                          ],
                        ),
                      ),
                    ),
                  ]
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
