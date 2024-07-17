import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/models/room.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/status_menu.dart';
import 'package:hostel_manager/app/repository/room_repo.dart';
import 'package:provider/provider.dart';

class RoomDescription extends StatelessWidget {
  const RoomDescription({
    required this.room,
    super.key,
  });

  final Room room;

  @override
  Widget build(BuildContext context) {
    final GlobalKey globalKey = GlobalKey();
    return Container(
      width: 335.w,
      height: 141.h,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            room.name,
            style: context.s16w500.copyWith(color: greyDark, height: 0),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            room.description,
            style: context.s13w400.copyWith(color: greyDark, height: 0),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '${room.price} руб/ночь',
              style: context.s13w500.copyWith(color: greyBlack, height: 0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Текущий статус', style: context.s14w400.copyWith(color: greyGrey, height: 0)),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () async {
                  var status = await statusMenu(context, globalKey);
                  if (status != null && context.mounted) {
                    context.read<RoomRepo>().setStatus(room.key, status);
                  }
                },
                child: Row(
                  children: [
                    Text(status[room.status!], style: context.s14w500.copyWith(color: greyDark, height: 0)),
                    SizedBox(width: 6.w),
                    Icon(
                      key: globalKey,
                      Icons.expand_more,
                      color: colorsAcc,
                      size: 24.h,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
