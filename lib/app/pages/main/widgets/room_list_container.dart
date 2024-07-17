import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:hostel_manager/app/internal/boxes.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/models/room.dart';
import 'package:hostel_manager/app/models/settings.dart';
import 'package:hostel_manager/app/repository/room_repo.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RoomListContainer extends StatefulWidget {
  const RoomListContainer({
    required this.vacancies,
    super.key,
  });

  final Iterable vacancies;

  @override
  State<RoomListContainer> createState() => _RoomListContainerState();
}

class _RoomListContainerState extends State<RoomListContainer> {
  PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      // height: 172.h,
      padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 12.h),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 110.h,
            width: 311.w,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: widget.vacancies.length,
              separatorBuilder: (context, index) => SizedBox(width: 12.w),
              itemBuilder: (context, index) {
                Room room = widget.vacancies.elementAt(index);
                return SizedBox(
                  width: 311.w,
                  height: 110.h,
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
                        width: 209.w,
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
                );
              },
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmoothPageIndicator(
                controller: controller,
                count: widget.vacancies.length,
                effect: ExpandingDotsEffect(
                  dotWidth: 4.h,
                  dotHeight: 4.h,
                  radius: 4.h,
                  spacing: 5.h,
                  dotColor: greyGrey,
                  activeDotColor: colorsAcc,
                ),
              ),
              FilledButton(
                onPressed: () {},
                style: context.extraBtn.copyWith(
                  minimumSize: WidgetStatePropertyAll(Size(192.w, 26.h)),
                  maximumSize: WidgetStatePropertyAll(Size(192.w, 26.h)),
                ),
                child: Text(
                  'Перейти к бронированию',
                  style: context.s14w400.copyWith(color: bg, letterSpacing: -1.w),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
