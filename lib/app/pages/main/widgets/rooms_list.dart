import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/pages/main/widgets/empty_rooms.dart';
import 'package:hostel_manager/app/pages/main/widgets/free_room_pin.dart';
import 'package:hostel_manager/app/pages/main/widgets/room_list_container.dart';
import 'package:hostel_manager/app/repository/room_repo.dart';
import 'package:hostel_manager/app/routing/app_router.gr.dart';
import 'package:provider/provider.dart';

class RoomsList extends StatelessWidget {
  const RoomsList({super.key});

  @override
  Widget build(BuildContext context) {
    Iterable vacancies = context.watch<RoomRepo>().vacancies();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Свободные номера', style: context.s20w500.copyWith(color: greyBlack)),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () async => AutoRouter.of(context).push(const RoomsView()),
              child: Text('Все номера', style: context.textUnderline),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        if (context.watch<RoomRepo>().repo.isEmpty) ...[
          const EmptyRooms(),
        ] else ...[
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              RoomListContainer(vacancies: vacancies),
              if (vacancies.isNotEmpty) ...[
                const FreeRoomPin(),
              ],
            ],
          ),
        ],
      ],
    );
  }
}
