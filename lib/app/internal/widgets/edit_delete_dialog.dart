import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/internal/utils.dart';

Future<String?> editDeleteDialog(BuildContext context, GlobalKey globalKey, [bool showDoneItem = false]) async {
  return await showMenu<String?>(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.h),
    ),
    context: context,
    color: const Color(0xFFFBFDFF),
    surfaceTintColor: const Color(0xFFFBFDFF),
    position: position(globalKey, context),
    elevation: 10,
    constraints: BoxConstraints(maxWidth: 130.w, minHeight: 84.h),
    items: [
      PopupMenuItem<String>(
        value: 'EDIT',
        height: 30.h,
        child: Text('Редактировать', style: context.s14w400.copyWith(color: greyDark)),
      ),
      const PopupMenuDivider(),
      PopupMenuItem<String>(
        value: 'DELETE',
        height: 30.h,
        child: Text('Удалить', style: context.s14w400.copyWith(color: colorsRed)),
      ),
    ],
  );
}
