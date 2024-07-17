import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/models/room.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/main_image.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/room_description.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/room_info.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/small_image.dart';
import 'package:hostel_manager/app/repository/room_repo.dart';
import 'package:hostel_manager/app/routing/app_router.gr.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SelectedRoomView extends StatelessWidget {
  const SelectedRoomView({required this.roomKey, super.key});

  final int roomKey;

  @override
  Widget build(BuildContext context) {
    Room room = context.watch<RoomRepo>().repo.get(roomKey);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => AutoRouter.of(context).removeLast(),
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
              onTap: () async => AutoRouter.of(context).push(AddRoom(roomKey: room.key)),
              child: SvgPicture.asset('assets/icons/Pen 2.svg', width: 24.h, height: 24.h),
            ),
          ),
        ],
        title: Text(room.name),
        backgroundColor: bg,
        surfaceTintColor: bg,
        shadowColor: const Color(0x3FABB1B9),
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.w, bottom: 92.h),
          child: Column(
            children: [
              Center(
                child: MainImage(image: room.image1),
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  if (room.image2.isNotEmpty) ...[
                    SmallImage(image: room.image2),
                    SizedBox(width: 8.w),
                  ],
                  if (room.image3.isNotEmpty) ...[
                    SmallImage(image: room.image3),
                    SizedBox(width: 8.w),
                  ],
                  if (room.image4.isNotEmpty) ...[
                    SmallImage(image: room.image4),
                    SizedBox(width: 8.w),
                  ],
                  if (room.image5.isNotEmpty) ...[
                    SmallImage(image: room.image5),
                    SizedBox(width: 8.w),
                  ],
                ],
              ),
              SizedBox(height: 12.h),
              RoomDescription(room: room),
              SizedBox(height: 12.h),
              RoomInfo(room: room),
            ],
          ),
        ),
      ),
    );
  }
}
