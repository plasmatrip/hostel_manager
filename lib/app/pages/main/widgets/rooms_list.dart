import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/pages/main/widgets/empty_rooms.dart';
import 'package:hostel_manager/app/repository/room_repo.dart';
import 'package:provider/provider.dart';

class RoomsList extends StatelessWidget {
  const RoomsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Свободные номера', style: context.s20w500.copyWith(color: greyBlack)),
            Text('Все номера', style: context.textUnderline),
          ],
        ),
        SizedBox(height: 12.h),
        if (context.watch<RoomRepo>().repo.isEmpty) ...[
          const EmptyRooms(),
        ],
      ],
    );
  }
}
