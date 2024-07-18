import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/repository/room_repo.dart';
import 'package:provider/provider.dart';

class StatusFilters extends StatefulWidget {
  const StatusFilters({
    super.key,
  });

  @override
  State<StatusFilters> createState() => _StatusFiltersState();
}

class _StatusFiltersState extends State<StatusFilters> {
  bool expanded = false;

  @override
  void initState() {
    if (context.read<RoomRepo>().statusFilter != 0) {
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
                Text('Статус номера', style: context.s17w500.copyWith(color: greyBlack)),
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
            for (int i = 0; i < 4; i++) ...[
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => switch (i) {
                  0 => context.read<RoomRepo>().statusFilter = context.read<RoomRepo>().statusFilter ^ Status.vacancies.mask,
                  1 => context.read<RoomRepo>().statusFilter = context.read<RoomRepo>().statusFilter ^ Status.booked.mask,
                  2 => context.read<RoomRepo>().statusFilter = context.read<RoomRepo>().statusFilter ^ Status.cleaning.mask,
                  _ => context.read<RoomRepo>().statusFilter = context.read<RoomRepo>().statusFilter ^ Status.repair.mask,
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      switch (i) {
                        0 => context.watch<RoomRepo>().statusFilter & Status.vacancies.mask == Status.vacancies.mask
                            ? 'assets/icons/Property 1=on.svg'
                            : 'assets/icons/Property 1=off.svg',
                        1 => context.watch<RoomRepo>().statusFilter & Status.booked.mask == Status.booked.mask
                            ? 'assets/icons/Property 1=on.svg'
                            : 'assets/icons/Property 1=off.svg',
                        2 => context.watch<RoomRepo>().statusFilter & Status.cleaning.mask == Status.cleaning.mask
                            ? 'assets/icons/Property 1=on.svg'
                            : 'assets/icons/Property 1=off.svg',
                        _ => context.watch<RoomRepo>().statusFilter & Status.repair.mask == Status.repair.mask
                            ? 'assets/icons/Property 1=on.svg'
                            : 'assets/icons/Property 1=off.svg',
                      },
                      width: 24.h,
                      height: 24.h,
                    ),
                    SizedBox(width: 4.w),
                    Text(status[i], style: context.s13w500.copyWith(color: greyDark, letterSpacing: -0.7.w)),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
            ],
          ],
        ],
      ),
    );
  }
}
