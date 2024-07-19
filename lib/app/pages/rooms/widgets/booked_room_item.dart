import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/internal/widgets/delete_dalog.dart';
import 'package:hostel_manager/app/internal/widgets/edit_delete_dialog.dart';
import 'package:hostel_manager/app/models/booking.dart';
import 'package:hostel_manager/app/models/room.dart';
import 'package:hostel_manager/app/repository/booking_repo.dart';
import 'package:hostel_manager/app/routing/app_router.gr.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BookedRoomItem extends StatelessWidget {
  const BookedRoomItem({
    required this.room,
    super.key,
  });

  final Room room;

  @override
  Widget build(BuildContext context) {
    final GlobalKey globalKey = GlobalKey();
    return Container(
      width: 335.w,
      height: 69.h,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 275.w,
                child: Text(
                  room.name,
                  style: context.s17w400.copyWith(color: greyDark),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () async {
                  var result = await editDeleteDialog(context, globalKey);
                  if (result != null && context.mounted) {
                    switch (result) {
                      case 'EDIT':
                        AutoRouter.of(context).push(AddBooking(bookingKey: (room.booking!.last as Booking).key));
                      case 'DELETE':
                        var result = await deleteDialog(context, 'Вы действительно хотите удалить бронирование?');
                        if (result != null && context.mounted) {
                          context.read<BookingRepo>().delete((room.booking!.last as Booking).key);
                        }
                    }
                  }
                },
                child: Icon(
                  key: globalKey,
                  Icons.more_horiz,
                  color: colorsAcc,
                  size: 24.h,
                ),
              ),
            ],
          ),
          Text(
            '${DateFormat('dd.MM.y', 'ru').format((room.booking!.last as Booking).arrival!)}-${DateFormat('dd.MM.y', 'ru').format((room.booking!.last as Booking).departure!)}',
            style: context.s14w300.copyWith(color: greyGrey),
          ),
        ],
      ),
    );
  }
}
