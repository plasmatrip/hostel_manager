import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/models/booking.dart';
import 'package:hostel_manager/app/models/room.dart';
import 'package:hostel_manager/app/pages/booking/widgets/booked_room_item.dart';
import 'package:hostel_manager/app/pages/booking/widgets/calendar.dart';
import 'package:hostel_manager/app/repository/booking_repo.dart';
import 'package:hostel_manager/app/repository/room_repo.dart';
import 'package:hostel_manager/app/routing/app_router.gr.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SelectedBookingRoomView extends StatelessWidget {
  const SelectedBookingRoomView({required this.roomKey, super.key});

  final int roomKey;

  @override
  Widget build(BuildContext context) {
    Room room = context.read<RoomRepo>().repo.get(roomKey);
    ({Map<int, bool> bookedDays, Iterable bookingList}) bookedData = context.watch<BookingRepo>().bookedDays(roomKey);
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
        title: Text(room.name),
        backgroundColor: bg,
        surfaceTintColor: bg,
        shadowColor: const Color(0x3FABB1B9),
        elevation: 10,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Column(
          children: [
            Calendar(
              bookedDays: bookedData.bookedDays,
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(top: 20.h, bottom: 92.h, left: 20.w, right: 20.w),
                itemCount: bookedData.bookingList.length,
                separatorBuilder: (context, index) => SizedBox(height: 20.h),
                itemBuilder: (context, index) {
                  Booking booking = bookedData.bookingList.elementAt(index);
                  return BookedRoomItem(booking: booking);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FilledButton(
        onPressed: context.watch<RoomRepo>().canBooked() ? () async => AutoRouter.of(context).push(AddBooking()) : null,
        style: context.extraBtn,
        child: const Text('Новое бронирование'),
      ),
    );
  }
}
