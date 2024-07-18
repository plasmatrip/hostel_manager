import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    if (context.read<RoomRepo>().bedFilter != null) {
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
          ],
        ],
      ),
    );
  }
}
