import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/repository/room_repo.dart';
import 'package:provider/provider.dart';

class PriceField extends StatefulWidget {
  const PriceField({
    super.key,
  });

  @override
  State<PriceField> createState() => _PriceFieldState();
}

class _PriceFieldState extends State<PriceField> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: context.read<RoomRepo>().price == 0 ? '' : context.read<RoomRepo>().price.toString());
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 335.w,
          height: 75.h,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Стоимость, руб', style: context.s14w400.copyWith(color: greyGrey)),
              SizedBox(height: 6.h),
              Padding(
                padding: EdgeInsets.only(left: 14.w),
                child: TextField(
                  controller: controller,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      context.read<RoomRepo>().price = int.parse(value);
                    } else {
                      context.read<RoomRepo>().price = 0;
                    }
                  },
                  style: context.s13w400.copyWith(color: greyDark),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(10)],
                  decoration: InputDecoration.collapsed(
                    border: InputBorder.none,
                    hintText: 'Стоимость номера за ночь',
                    hintStyle: context.s13w200.copyWith(color: greyGrey),
                  ),
                ),
              ),
              Divider(color: greyGrey, thickness: 0.3.h, height: 1.h),
            ],
          ),
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
