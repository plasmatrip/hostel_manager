import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:hostel_manager/app/internal/boxes.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/models/room.dart';
import 'package:hostel_manager/app/models/settings.dart';
import 'package:hostel_manager/app/repository/room_repo.dart';
import 'package:hostel_manager/app/routing/app_router.gr.dart';

class RoomItem extends StatelessWidget {
  const RoomItem({
    required this.room,
    super.key,
  });

  final Room room;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async => AutoRouter.of(context).push(SelectedRoomView(roomKey: room.key)),
      child: SizedBox(
        width: 311.w,
        height: 115.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 90.w,
              height: 110.h,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: FileImage(File('${Hive.box<Settings>(Boxes.settings).getAt(0)!.appDir}/${room.image1}')),
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            SizedBox(
              width: 209.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    room.name,
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
                            Text('${room.floor! + 1} этаж', style: context.s12w400.copyWith(color: greyDark, letterSpacing: -1.w)),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset('assets/icons/Double Bed.svg', width: 12.w, height: 12.h),
                            SizedBox(width: 6.w),
                            Text(bed[room.bed!], style: context.s12w400.copyWith(color: greyDark, letterSpacing: -1.w)),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset('assets/icons/Eye.svg', width: 12.w, height: 12.h),
                            SizedBox(width: 6.w),
                            Text(view[room.view!], style: context.s12w400.copyWith(color: greyDark, letterSpacing: -1.w)),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset('assets/icons/Bath Tub.svg', width: 12.w, height: 12.h),
                            SizedBox(width: 6.w),
                            Text(room.toilet! == true ? 'В номере' : 'На этаже', style: context.s12w400.copyWith(color: greyDark, letterSpacing: -1.w)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      if (room.wifi! == true) ...[
                        Padding(
                          padding: EdgeInsets.only(right: 6.w),
                          child: SvgPicture.asset('assets/icons/Wii-Fi.svg', width: 12.w, height: 12.h),
                        ),
                      ],
                      if (room.bathAccessories! == true) ...[
                        SvgPicture.asset('assets/icons/Towel.svg', width: 12.w, height: 12.h),
                      ],
                    ],
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text('${room.price} руб/ночь', style: context.s13w500.copyWith(color: greyBlack)),
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
