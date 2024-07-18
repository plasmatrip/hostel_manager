import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/models/room.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/calendar_button.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/add_room_button.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/room_item.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/search_block.dart';
import 'package:hostel_manager/app/repository/room_repo.dart';
import 'package:hostel_manager/app/routing/app_router.gr.dart';
import 'package:provider/provider.dart';

@RoutePage()
class RoomsView extends StatelessWidget {
  const RoomsView({super.key});

  @override
  Widget build(BuildContext context) {
    Iterable rooms = context.watch<RoomRepo>().rooms();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              AutoRouter.of(context).removeLast();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: colorsAcc,
              size: 24.h,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 24.w),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () async => AutoRouter.of(context).push(const FiltersView()),
                child: SvgPicture.asset('assets/icons/Settings.svg', width: 24.h, height: 24.h),
              ),
            ),
          ],
          title: const Text('Номера'),
          backgroundColor: bg,
          surfaceTintColor: bg,
          shadowColor: const Color(0x3FABB1B9),
          elevation: 10,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SearchBlock(width: 239.w),
                  const CalendarButton(),
                  const AddRoomButton(),
                ],
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.only(top: 20.h, bottom: 92.h),
                  itemCount: rooms.length,
                  separatorBuilder: (context, index) => SizedBox(height: 16.h),
                  itemBuilder: (context, index) {
                    Room room = rooms.elementAt(index);
                    return RoomItem(room: room);
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FilledButton(
          onPressed: context.watch<RoomRepo>().canBooked() ? () {} : null,
          style: context.extraBtn,
          child: const Text('Новое бронирование'),
        ),
      ),
    );
  }
}
