import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/pages/main/widgets/room_item.dart';
import 'package:hostel_manager/app/models/room.dart';
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
      // height: 184.h,
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
            width: 311.w,
            height: 115.h,
            child: widget.vacancies.isEmpty
                ? Center(
                    child: Text(
                      'Свободных номеров нет',
                      style: context.s12w400.copyWith(color: greyGrey),
                    ),
                  )
                : ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.vacancies.length,
                    separatorBuilder: (context, index) => SizedBox(width: 12.w),
                    itemBuilder: (context, index) {
                      Room room = widget.vacancies.elementAt(index);
                      return RoomItem(room: room);
                    },
                  ),
          ),
          if (widget.vacancies.isNotEmpty) ...[
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
                      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 10.w))),
                  child: Text(
                    'Перейти к бронированию',
                    style: context.s14w400.copyWith(color: bg, letterSpacing: -1.w),
                  ),
                ),
              ],
            )
          ],
        ],
      ),
    );
  }
}
