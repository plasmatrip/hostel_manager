import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:hostel_manager/app/internal/boxes.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/models/settings.dart';
import 'package:hostel_manager/app/repository/booking_repo.dart';
import 'package:hostel_manager/app/repository/room_repo.dart';
import 'package:provider/provider.dart';

class RoomItem extends StatelessWidget {
  const RoomItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 311.w,
      padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 12.h, bottom: 12.h),
      decoration: ShapeDecoration(
        color: colors_1,
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
      child: SizedBox(
        width: 287.w,
        height: 117.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 90.w,
              height: 110.h,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: FileImage(File('${Hive.box<Settings>(Boxes.settings).getAt(0)!.appDir}/${context.watch<BookingRepo>().getRoom()!.image1}')),
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            SizedBox(
              width: 185.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.watch<BookingRepo>().getRoom()!.name,
                    style: context.s15w500.copyWith(color: greyBlack),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 6.h),
                    child: Wrap(
                      spacing: 16.w,
                      runSpacing: 3.h,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset('assets/icons/Downstairs.svg', width: 12.w, height: 12.h),
                            SizedBox(width: 6.w),
                            Text('${context.watch<BookingRepo>().getRoom()!.floor! + 1} этаж',
                                style: context.s12w400.copyWith(color: greyDark, letterSpacing: -1.w)),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset('assets/icons/Double Bed.svg', width: 12.w, height: 12.h),
                            SizedBox(width: 6.w),
                            Text(bed[context.watch<BookingRepo>().getRoom()!.bed!], style: context.s12w400.copyWith(color: greyDark, letterSpacing: -1.w)),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset('assets/icons/Eye.svg', width: 12.w, height: 12.h),
                            SizedBox(width: 6.w),
                            Text(view[context.watch<BookingRepo>().getRoom()!.view!], style: context.s12w400.copyWith(color: greyDark, letterSpacing: -1.w)),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset('assets/icons/Bath Tub.svg', width: 12.w, height: 12.h),
                            SizedBox(width: 6.w),
                            Text(context.watch<BookingRepo>().getRoom()!.toilet! == true ? 'В номере' : 'На этаже',
                                style: context.s12w400.copyWith(color: greyDark, letterSpacing: -1.w)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      if (context.watch<BookingRepo>().getRoom()!.wifi! == true) ...[
                        Padding(
                          padding: EdgeInsets.only(right: 6.w),
                          child: SvgPicture.asset('assets/icons/Wii-Fi.svg', width: 12.w, height: 12.h),
                        ),
                      ],
                      if (context.watch<BookingRepo>().getRoom()!.bathAccessories! == true) ...[
                        SvgPicture.asset('assets/icons/Towel.svg', width: 12.w, height: 12.h),
                      ],
                    ],
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text('${context.watch<BookingRepo>().getRoom()!.price} руб/ночь', style: context.s13w500.copyWith(color: greyBlack)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
