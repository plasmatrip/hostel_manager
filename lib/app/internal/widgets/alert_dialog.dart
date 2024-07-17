import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';

Future<String?> alertDialog(BuildContext context, String question) {
  return showDialog<String>(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.h)),
            backgroundColor: bg,
            surfaceTintColor: bg,
            elevation: 10,
            actionsPadding: EdgeInsets.zero,
            actionsAlignment: MainAxisAlignment.center,
            insetPadding: EdgeInsets.zero,
            actions: <Widget>[
              SizedBox(
                width: 327.w,
                height: 156.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      child: Text(
                        question,
                        style: context.s14w400.copyWith(color: greyDark),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Spacer(),
                    FilledButton(
                      onPressed: () => Navigator.of(context, rootNavigator: true).pop('CANCEL'),
                      style: context.btnCanel,
                      child: Text('Закрыть', style: context.s16w400.copyWith(color: Colors.black)),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
