import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/internal/widgets/alert_dialog.dart';
import 'package:hostel_manager/app/models/room.dart';
import 'package:hostel_manager/app/pages/booking/widgets/room_item.dart';
import 'package:hostel_manager/app/pages/main/widgets/free_room_pin.dart';
import 'package:hostel_manager/app/repository/booking_repo.dart';
import 'package:hostel_manager/app/routing/app_router.gr.dart';
import 'package:provider/provider.dart';

class RoomField extends StatelessWidget {
  const RoomField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async {
            var room = await AutoRouter.of(context).push(RoomsView(booking: true));
            if (room != null && context.mounted) {
              if (!context.read<BookingRepo>().roomReserved(room as Room)) {
                context.read<BookingRepo>().addRoom(room);
              } else {
                await alertDialog(context, 'На выбранные даты комната занята!');
              }
            }
          },
          child: Container(
            width: 335.w,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Выберите номер', style: context.s14w400.copyWith(color: greyGrey)),
                Align(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset('assets/icons/Notes Minimalistic.svg', width: 24.w, height: 24.h),
                ),
                if (context.watch<BookingRepo>().getRoom() != null) ...[
                  SizedBox(height: 12.h),
                  const Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      RoomItem(),
                      FreeRoomPin(),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
