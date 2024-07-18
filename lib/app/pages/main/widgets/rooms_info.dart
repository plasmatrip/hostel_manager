import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/repository/room_repo.dart';
import 'package:provider/provider.dart';

class RoomsInfo extends StatelessWidget {
  const RoomsInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 335.w,
          height: 93.w,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/Subtract.png'),
            ),
          ),
        ),
        if (context.watch<RoomRepo>().repo.isEmpty) ...[
          Positioned(
            left: 137.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Информация отсутствует',
                  style: context.s14w400.copyWith(color: greyGrey),
                ),
              ],
            ),
          ),
        ] else ...[
          Positioned(
            left: 115.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Всего номеров',
                      style: context.s14w400.copyWith(color: greyGrey),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      'Занятость',
                      style: context.s14w400.copyWith(color: greyGrey),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      'Свободных номеров',
                      style: context.s14w400.copyWith(color: greyGrey),
                    ),
                  ],
                ),
                SizedBox(width: 6.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.watch<RoomRepo>().repo.length.toString(),
                      style: context.s16w500.copyWith(color: greyBlack),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      '${context.watch<RoomRepo>().bookedPercent()}%',
                      style: context.s16w500.copyWith(color: greyBlack),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      context.watch<RoomRepo>().vacantRooms().toString(),
                      style: context.s16w500.copyWith(color: greyBlack),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
        Positioned(
          left: 4.w,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 89.w,
                height: 89.w,
                child: CircularProgressIndicator(
                  value: context.watch<RoomRepo>().bookedRooms() / 100,
                  color: colorsAcc,
                  backgroundColor: colors_4,
                  strokeCap: StrokeCap.round,
                  strokeWidth: 6.w,
                ),
              ),
              Text(
                '${context.watch<RoomRepo>().bookedPercent()}%',
                style: context.s24w500.copyWith(color: greyGrey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
