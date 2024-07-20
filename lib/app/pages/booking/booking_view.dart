import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:hostel_manager/app/internal/boxes.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/models/booking.dart';
import 'package:hostel_manager/app/models/room.dart';
import 'package:hostel_manager/app/models/settings.dart';
import 'package:hostel_manager/app/pages/main/widgets/free_room_pin.dart';
import 'package:hostel_manager/app/repository/booking_repo.dart';
import 'package:hostel_manager/app/repository/room_repo.dart';
import 'package:hostel_manager/app/routing/app_router.gr.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

@RoutePage()
class BookingView extends StatefulWidget {
  const BookingView({required this.bookingKey, super.key});

  final int bookingKey;

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  late Booking booking;
  late Room room;

  @override
  void initState() {
    booking = context.read<BookingRepo>().repo.get(widget.bookingKey);
    room = booking.room!.last as Room;
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
                context.read<BookingRepo>().edit(booking.key);
                var result = await AutoRouter.of(context).push(AddBooking());
                if (result == true) {
                  setState(() {
                    booking = context.read<BookingRepo>().repo.get(widget.bookingKey);
                  });
                }
              },
              child: SvgPicture.asset('assets/icons/Pen 2.svg', width: 24.h, height: 24.h),
            ),
          ),
        ],
        title: Text((booking.room!.last as Room).name),
        backgroundColor: bg,
        surfaceTintColor: bg,
        shadowColor: const Color(0x3FABB1B9),
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 92.h),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 335.w,
                    padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 12.h, bottom: 12.h),
                    decoration: ShapeDecoration(
                      color: colors_1,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.1.h, color: greyGrey),
                        borderRadius: BorderRadius.circular(8.h),
                      ),
                      shadows: [
                        BoxShadow(
                          color: const Color(0x3FABB1B9),
                          blurRadius: 12.h,
                          offset: Offset(0, 2.h),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: SizedBox(
                      width: 287.w,
                      height: 117.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 90.w,
                            height: 110.h,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: FileImage(File('${Hive.box<Settings>(Boxes.settings).getAt(0)!.appDir}/${room.image1}')),
                                fit: BoxFit.cover,
                              ),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                          SizedBox(
                            width: 185.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  room.name,
                                  style: context.s15w500.copyWith(color: greyBlack),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 6.h),
                                  child: Wrap(
                                    spacing: 16.w,
                                    runSpacing: 3.h,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SvgPicture.asset('assets/icons/Downstairs.svg', width: 12.w, height: 12.h),
                                          SizedBox(width: 6.w),
                                          Text('${room.floor! + 1} этаж', style: context.s12w400.copyWith(color: greyDark, letterSpacing: -1.w)),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SvgPicture.asset('assets/icons/Double Bed.svg', width: 12.w, height: 12.h),
                                          SizedBox(width: 6.w),
                                          Text(bed[room.bed!], style: context.s12w400.copyWith(color: greyDark, letterSpacing: -1.w)),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SvgPicture.asset('assets/icons/Eye.svg', width: 12.w, height: 12.h),
                                          SizedBox(width: 6.w),
                                          Text(view[room.view!], style: context.s12w400.copyWith(color: greyDark, letterSpacing: -1.w)),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SvgPicture.asset('assets/icons/Bath Tub.svg', width: 12.w, height: 12.h),
                                          SizedBox(width: 6.w),
                                          Text(room.toilet! == true ? 'В номере' : 'На этаже',
                                              style: context.s12w400.copyWith(color: greyDark, letterSpacing: -1.w)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    if (room.wifi! == true) ...[
                                      Padding(
                                        padding: EdgeInsets.only(right: 6.w),
                                        child: SvgPicture.asset('assets/icons/Wii-Fi.svg', width: 12.w, height: 12.h),
                                      ),
                                    ],
                                    if (room.bathAccessories! == true) ...[
                                      SvgPicture.asset('assets/icons/Towel.svg', width: 12.w, height: 12.h),
                                    ],
                                  ],
                                ),
                                const Spacer(),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text('${room.price} руб/ночь', style: context.s13w500.copyWith(color: greyBlack)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const FreeRoomPin(),
                ],
              ),
              SizedBox(height: 16.h),
              Container(
                width: 335.w,
                // height: 386.h,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                decoration: ShapeDecoration(
                  color: bg,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.h)),
                  shadows: [
                    BoxShadow(
                      color: const Color(0x3FABB1B9),
                      blurRadius: 12.h,
                      offset: Offset(0, 2.h),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat('dd.MM.y', 'ru').format(booking.arrival!),
                          style: context.s15w400.copyWith(color: greyDark),
                        ),
                        SizedBox(width: 12.w),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/Calendar Date.svg', width: 24.w, height: 24.h),
                            Positioned(
                              bottom: 5.h,
                              child: Text(
                                (booking.departure!.difference(booking.arrival!).inDays + 1).toString(),
                                style: context.s6w400.copyWith(color: greyDark),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          DateFormat('dd.MM.y', 'ru').format(booking.departure!),
                          style: context.s15w400.copyWith(color: greyDark),
                        ),
                      ],
                    ),
                    Divider(color: greyLight, thickness: 0.2.h, height: 24.h),
                    Text('Раннее заселение', style: context.s14w400.copyWith(color: greyGrey)),
                    SizedBox(height: 6.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(booking.earlyCheckin! ? 'Да' : 'Нет', style: context.s15w500.copyWith(color: greyDark)),
                    ),
                    SizedBox(height: 12.h),
                    Text('Завтраки', style: context.s14w400.copyWith(color: greyGrey)),
                    SizedBox(height: 6.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(booking.breakfast! ? 'Включено' : 'Нет', style: context.s15w500.copyWith(color: greyDark)),
                    ),
                    SizedBox(height: 12.h),
                    Text('Сумма, руб', style: context.s14w400.copyWith(color: greyGrey)),
                    SizedBox(height: 6.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(booking.sum.toString(), style: context.s15w500.copyWith(color: greyDark)),
                    ),
                    Divider(color: greyLight, thickness: 0.2.h, height: 24.h),
                    Text('Информация о бронирующем', style: context.s14w400.copyWith(color: greyGrey)),
                    SizedBox(height: 6.h),
                    Text(booking.name, style: context.s15w500.copyWith(color: greyDark)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(booking.email, style: context.s14w300.copyWith(color: greyDark)),
                        Text(booking.phone, style: context.s14w300.copyWith(color: greyDark)),
                      ],
                    ),
                    Divider(color: greyLight, thickness: 0.2.h, height: 24.h),
                    Text('Комментарий', style: context.s14w400.copyWith(color: greyGrey)),
                    SizedBox(height: 6.h),
                    Text(booking.comment, style: context.s15w500.copyWith(color: greyDark)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
