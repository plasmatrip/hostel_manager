import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/repository/room_repo.dart';
import 'package:provider/provider.dart';

class ToiletFilters extends StatefulWidget {
  const ToiletFilters({
    super.key,
  });

  @override
  State<ToiletFilters> createState() => _ToiletFiltersState();
}

class _ToiletFiltersState extends State<ToiletFilters> {
  bool expanded = false;

  @override
  void initState() {
    if (context.read<RoomRepo>().toiletFilter != null) {
      expanded = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: ShapeDecoration(
        color: bg,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.h)),
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
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              setState(() {
                expanded = !expanded;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Собственный туалет', style: context.s17w500.copyWith(color: greyBlack)),
                if (expanded) ...[
                  Icon(Icons.expand_less, color: greyGrey, size: 24.h),
                ] else ...[
                  Icon(Icons.arrow_forward_ios, color: colorsAcc, size: 24.h),
                ],
              ],
            ),
          ),
          if (expanded) ...[
            SizedBox(height: 12.h),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => context.read<RoomRepo>().toiletFilter = true,
              child: SizedBox(
                height: 24.h,
                width: 148.w,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      context.watch<RoomRepo>().toiletFilter == null
                          ? 'assets/icons/Property 1=off-1.svg'
                          : context.read<RoomRepo>().toiletFilter == true
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
            SizedBox(height: 12.h),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => context.read<RoomRepo>().toiletFilter = false,
              child: SizedBox(
                height: 24.h,
                width: 148.w,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      context.read<RoomRepo>().toiletFilter == null
                          ? 'assets/icons/Property 1=off-1.svg'
                          : context.read<RoomRepo>().toiletFilter == false
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
        ],
      ),
    );
  }
}
