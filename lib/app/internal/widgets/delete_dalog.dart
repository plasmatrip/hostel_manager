import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';

Future<String?> deleteDialog(BuildContext context, String question) {
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
            actionsPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            actionsAlignment: MainAxisAlignment.center,
            insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
            actions: <Widget>[
              SizedBox(
                width: 327.w,
                height: 156.h,
                child: Column(
                  children: [
                    Text(
                      'Удалить',
                      style: context.s24w600.copyWith(color: colorsRed),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    Text(
                      question,
                      style: context.s14w400.copyWith(color: greyDark),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FilledButton(
                            onPressed: () => Navigator.of(context, rootNavigator: true).pop('CANCEL'),
                            style: context.btnCanel.copyWith(
                                minimumSize: WidgetStatePropertyAll(Size(84.w, 24.h)),
                                maximumSize: WidgetStatePropertyAll(Size(84.w, 24.h)),
                                padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 10.w))),
                            child: Text(
                              'Закрыть',
                              style: context.s14w400.copyWith(color: colorsAcc),
                            ),
                          ),
                          FilledButton(
                            onPressed: () => Navigator.of(context, rootNavigator: true).pop('DELETE'),
                            style: context.btnOk.copyWith(
                                minimumSize: WidgetStatePropertyAll(Size(172.w, 24.h)),
                                maximumSize: WidgetStatePropertyAll(Size(172.w, 24.h)),
                                backgroundColor: const WidgetStatePropertyAll(colorsRed)),
                            child: Text(
                              'Удалить',
                              style: context.s14w400.copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
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
