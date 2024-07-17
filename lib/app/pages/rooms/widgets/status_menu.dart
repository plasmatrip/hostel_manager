import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/internal/utils.dart';

Future<int?> statusMenu(BuildContext context, GlobalKey globalKey) async {
  return await showMenu<int?>(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.h),
    ),
    context: context,
    color: bg,
    surfaceTintColor: bg,
    shadowColor: const Color(0x3FABB1B9),
    position: position(globalKey, context),
    elevation: 10,
    constraints: BoxConstraints(minWidth: 100.w, minHeight: 100.h),
    items: [
      PopupMenuItem<int>(
        value: 0,
        height: 30.h,
        child: Text('Свободна', style: context.s8w500.copyWith(color: greyDark)),
      ),
      PopupMenuItem<int>(
        value: 1,
        height: 30.h,
        child: Text('Занята', style: context.s8w500.copyWith(color: greyDark)),
      ),
      PopupMenuItem<int>(
        value: 2,
        height: 30.h,
        child: Text('Уборка', style: context.s8w500.copyWith(color: greyDark)),
      ),
      PopupMenuItem<int>(
        value: 3,
        height: 30.h,
        child: Text('Ремонт', style: context.s8w500.copyWith(color: greyDark)),
      ),
    ],
  );
}
