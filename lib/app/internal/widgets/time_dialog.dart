import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:wheel_picker/wheel_picker.dart';

Future<DateTime?> timeDialog(BuildContext context, DateTime? selectedTime) {
  selectedTime ??= DateTime.now();
  int hour = selectedTime.hour;
  int minute = selectedTime.minute;

  late final hoursWheel = WheelPickerController(
    itemCount: 24,
    initialIndex: hour,
  );
  late final minutesWheel = WheelPickerController(
    itemCount: 60,
    initialIndex: minute,
    mounts: [hoursWheel],
  );
  final wheelStyle = WheelPickerStyle(
    size: 90.h,
    itemExtent: 34.h,
    squeeze: 1.45,
    diameterRatio: 1.1,
    surroundingOpacity: .15,
    magnification: 1.2,
  );

  Widget itemBuilder(BuildContext context, int index) {
    return Text("$index".padLeft(2, '0'), style: context.s22w400.copyWith(color: greyBlack));
  }

  return showDialog<DateTime>(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.h)),
            backgroundColor: bg,
            surfaceTintColor: bg,
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            clipBehavior: Clip.none,
            content: SizedBox(
              width: 335.w,
              height: 148.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WheelPicker(
                        builder: itemBuilder,
                        controller: hoursWheel,
                        style: wheelStyle,
                        onIndexChanged: (index) => hour = index,
                      ),
                      Text(' : ', style: context.s22w400.copyWith(color: greyBlack)),
                      WheelPicker(
                        builder: itemBuilder,
                        controller: minutesWheel,
                        style: wheelStyle,
                        enableTap: true,
                        onIndexChanged: (index) => minute = index,
                      )
                    ],
                  ),
                  FilledButton(
                    style: context.btnOk.copyWith(
                      minimumSize: WidgetStatePropertyAll(Size(85.w, 26.h)),
                      maximumSize: WidgetStatePropertyAll(Size(85.w, 26.h)),
                    ),
                    onPressed: () => AutoRouter.of(context).maybePop(DateTime(selectedTime!.year, selectedTime.month, selectedTime.day, hour, minute)),
                    child: const Text('Выбрать'),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
