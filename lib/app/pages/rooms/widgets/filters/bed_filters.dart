import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/repository/room_repo.dart';
import 'package:provider/provider.dart';

class BedFilters extends StatefulWidget {
  const BedFilters({
    super.key,
  });

  @override
  State<BedFilters> createState() => _BedFiltersState();
}

class _BedFiltersState extends State<BedFilters> {
  bool expanded = false;

  @override
  void initState() {
    if (context.read<RoomRepo>().bedFilter != 0) {
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
                Text('Кровать', style: context.s17w500.copyWith(color: greyBlack)),
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
            for (int i = 0; i < 6; i++) ...[
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => switch (i) {
                  0 => context.read<RoomRepo>().bedFilter = context.read<RoomRepo>().bedFilter ^ Bed.double.mask,
                  1 => context.read<RoomRepo>().bedFilter = context.read<RoomRepo>().bedFilter ^ Bed.twoBeds.mask,
                  2 => context.read<RoomRepo>().bedFilter = context.read<RoomRepo>().bedFilter ^ Bed.single.mask,
                  3 => context.read<RoomRepo>().bedFilter = context.read<RoomRepo>().bedFilter ^ Bed.threeBeds.mask,
                  4 => context.read<RoomRepo>().bedFilter = context.read<RoomRepo>().bedFilter ^ Bed.kingSize.mask,
                  _ => context.read<RoomRepo>().bedFilter = context.read<RoomRepo>().bedFilter ^ Bed.multipleBeds.mask,
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      switch (i) {
                        0 => context.watch<RoomRepo>().bedFilter & Bed.double.mask == Bed.double.mask
                            ? 'assets/icons/Property 1=on.svg'
                            : 'assets/icons/Property 1=off.svg',
                        1 => context.watch<RoomRepo>().bedFilter & Bed.twoBeds.mask == Bed.twoBeds.mask
                            ? 'assets/icons/Property 1=on.svg'
                            : 'assets/icons/Property 1=off.svg',
                        2 => context.watch<RoomRepo>().bedFilter & Bed.single.mask == Bed.single.mask
                            ? 'assets/icons/Property 1=on.svg'
                            : 'assets/icons/Property 1=off.svg',
                        3 => context.watch<RoomRepo>().bedFilter & Bed.threeBeds.mask == Bed.threeBeds.mask
                            ? 'assets/icons/Property 1=on.svg'
                            : 'assets/icons/Property 1=off.svg',
                        4 => context.watch<RoomRepo>().bedFilter & Bed.kingSize.mask == Bed.kingSize.mask
                            ? 'assets/icons/Property 1=on.svg'
                            : 'assets/icons/Property 1=off.svg',
                        _ => context.watch<RoomRepo>().bedFilter & Bed.multipleBeds.mask == Bed.multipleBeds.mask
                            ? 'assets/icons/Property 1=on.svg'
                            : 'assets/icons/Property 1=off.svg',
                      },
                      width: 24.h,
                      height: 24.h,
                    ),
                    SizedBox(width: 4.w),
                    Text(bed[i], style: context.s13w500.copyWith(color: greyDark, letterSpacing: -0.7.w)),
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
