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
import 'package:hostel_manager/app/pages/rooms/widgets/status_menu.dart';
import 'package:hostel_manager/app/repository/room_repo.dart';
import 'package:hostel_manager/app/routing/app_router.gr.dart';
import 'package:provider/provider.dart';

class RoomItem extends StatelessWidget {
  const RoomItem({
    required this.room,
    required this.booking,
    super.key,
  });

  final Room room;
  final bool booking;

  @override
  Widget build(BuildContext context) {
    final GlobalKey globalKey = GlobalKey();
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        if (booking) {
          AutoRouter.of(context).maybePop(room);
        } else {
          AutoRouter.of(context).push(SelectedRoomView(roomKey: room.key));
        }
      },
      child: Container(
        width: 335.w,
        height: 140.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: ShapeDecoration(
          color: switch (room.status!) {
            0 => colors_1,
            1 => colors_3,
            2 => colors_4,
            _ => colors_6,
          },
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 130.w,
                        child: Text(
                          room.name,
                          style: context.s15w500.copyWith(color: greyBlack),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () async {
                          var status = await statusMenu(context, globalKey);
                          if (status != null && context.mounted) {
                            context.read<RoomRepo>().setStatus(room.key, status);
                          }
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              status[room.status!],
                              style: context.s8w500.copyWith(color: greyDark),
                            ),
                            SizedBox(width: 6.w),
                            Icon(
                              key: globalKey,
                              Icons.expand_more,
                              color: colorsAcc,
                              size: 24.h,
                            )
                          ],
                        ),
                      )
                    ],
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
