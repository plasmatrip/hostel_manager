import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/models/room.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/status_menu.dart';
import 'package:hostel_manager/app/repository/room_repo.dart';
import 'package:provider/provider.dart';

class RoomInfo extends StatelessWidget {
  const RoomInfo({
    required this.room,
    super.key,
  });

  final Room room;

  @override
  Widget build(BuildContext context) {
    final GlobalKey globalKey = GlobalKey();
    return Container(
      width: 335.w,
      height: 222.h,
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Этаж', style: context.s14w400.copyWith(color: greyGrey, height: 0)),
              Text(room.floor!.toString(), style: context.s14w500.copyWith(color: greyDark, height: 0)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Кровать', style: context.s14w400.copyWith(color: greyGrey, height: 0)),
              Text(bed[room.bed!], style: context.s14w500.copyWith(color: greyDark, height: 0)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Вид', style: context.s14w400.copyWith(color: greyGrey, height: 0)),
              Text(view[room.view!], style: context.s14w500.copyWith(color: greyDark, height: 0)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('WI-fi', style: context.s14w400.copyWith(color: greyGrey, height: 0)),
              Text(room.wifi! ? 'Есть' : 'Нет', style: context.s14w500.copyWith(color: greyDark, height: 0)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Собственный туалет', style: context.s14w400.copyWith(color: greyGrey, height: 0)),
              Text(room.toilet! ? 'Есть' : 'Нет', style: context.s14w500.copyWith(color: greyDark, height: 0)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Ванные принадлежности', style: context.s14w400.copyWith(color: greyGrey, height: 0)),
              Text(room.bathAccessories! ? 'Есть' : 'Нет', style: context.s14w500.copyWith(color: greyDark, height: 0)),
            ],
          ),
        ],
      ),
    );
  }
}
