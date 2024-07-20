import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/models/booking.dart';
import 'package:hostel_manager/app/pages/booking/widgets/booked_room_item.dart';
import 'package:hostel_manager/app/repository/booking_repo.dart';
import 'package:provider/provider.dart';

class BookedRoomList extends StatelessWidget {
  const BookedRoomList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Iterable bookedRooms = context.watch<BookingRepo>().bookedForDay();
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.only(top: 20.h, bottom: 92.h),
        itemCount: bookedRooms.length,
        separatorBuilder: (context, index) => SizedBox(height: 20.h),
        itemBuilder: (context, index) {
          Booking booking = bookedRooms.elementAt(index);
          return BookedRoomItem(booking: booking);
        },
      ),
    );
  }
}
