import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/repository/booking_repo.dart';
import 'package:provider/provider.dart';

class CalendarSearchBlock extends StatefulWidget {
  const CalendarSearchBlock({
    required this.width,
    super.key,
  });

  final double width;

  @override
  State<CalendarSearchBlock> createState() => _CalendarSearchBlockState();
}

class _CalendarSearchBlockState extends State<CalendarSearchBlock> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: context.read<BookingRepo>().searchString);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: 32.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: ShapeDecoration(
        color: bg,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.1.h, color: greyGrey),
          borderRadius: BorderRadius.circular(8),
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
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        onChanged: (value) => context.read<BookingRepo>().searchString = value,
        style: context.s13w400.copyWith(color: greyDark),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Искать',
          hintStyle: context.s12w300.copyWith(color: greyGrey),
          suffixIcon: SvgPicture.asset(
            'assets/icons/Magnifer.svg',
            fit: BoxFit.none,
          ),
        ),
      ),
    );
  }
}
