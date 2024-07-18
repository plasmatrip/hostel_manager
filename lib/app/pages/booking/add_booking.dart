import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/pages/booking/widgets/fields/arrival_field.dart';
import 'package:hostel_manager/app/pages/booking/widgets/fields/breakfast_field.dart';
import 'package:hostel_manager/app/pages/booking/widgets/fields/comment_field.dart';
import 'package:hostel_manager/app/pages/booking/widgets/fields/departure_field.dart';
import 'package:hostel_manager/app/pages/booking/widgets/fields/early_checkin_field.dart';
import 'package:hostel_manager/app/pages/booking/widgets/fields/email_field.dart';
import 'package:hostel_manager/app/pages/booking/widgets/fields/name_field.dart';
import 'package:hostel_manager/app/pages/booking/widgets/fields/phone_field.dart';
import 'package:hostel_manager/app/pages/booking/widgets/fields/room_field.dart';
import 'package:hostel_manager/app/pages/booking/widgets/fields/sum_field.dart';
import 'package:hostel_manager/app/repository/booking_repo.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AddBooking extends StatelessWidget {
  const AddBooking({super.key, this.bookingKey});

  final int? bookingKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async {
            // context.read<RoomRepo>().clear();
            AutoRouter.of(context).removeLast();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: colorsAcc,
            size: 24.h,
          ),
        ),
        title: const Text('Новое бронирование'),
        backgroundColor: bg,
        surfaceTintColor: bg,
        shadowColor: const Color(0x3FABB1B9),
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 92.h),
          child: const Column(
            children: [
              RoomField(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ArrivalField(),
                  DepartureField(),
                ],
              ),
              CommentField(),
              NameField(),
              PhoneField(),
              EmailField(),
              EarlyCheckinField(),
              BreakfastField(),
              SumField(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FilledButton(
        onPressed: context.watch<BookingRepo>().canSave() ? () {} : null,
        style: context.extraBtn,
        child: const Text('Забронировать'),
      ),
    );
  }
}
