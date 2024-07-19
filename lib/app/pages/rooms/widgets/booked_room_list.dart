import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/models/room.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/booked_room_item.dart';
import 'package:hostel_manager/app/repository/room_repo.dart';
import 'package:provider/provider.dart';

class BookedRoomList extends StatelessWidget {
  const BookedRoomList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Iterable rooms = context.watch<RoomRepo>().bookedForDay();
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.only(top: 20.h, bottom: 92.h),
        itemCount: rooms.length,
        separatorBuilder: (context, index) => SizedBox(height: 20.h),
        itemBuilder: (context, index) {
          Room room = rooms.elementAt(index);
          return BookedRoomItem(room: room);
        },
      ),
    );
  }
}
