import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/models/room.dart';
import 'package:hostel_manager/app/repository/room_repo.dart';
import 'package:hostel_manager/app/routing/app_router.gr.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SelectedRoomView extends StatefulWidget {
  const SelectedRoomView({required this.roomKey, super.key});

  final int roomKey;

  @override
  State<SelectedRoomView> createState() => _SelectedRoomViewState();
}

class _SelectedRoomViewState extends State<SelectedRoomView> {
  late Room room;

  @override
  void initState() {
    room = context.read<RoomRepo>().repo.get(widget.roomKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              onTap: () async {
                var result = await AutoRouter.of(context).push(AddRoom(roomKey: room.key));
                if (result == true) {
                  setState(() {
                    room = context.read<RoomRepo>().repo.get(widget.roomKey);
                  });
                }
              },
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
    );
  }
}
