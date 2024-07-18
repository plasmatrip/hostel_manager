import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/internal/utils.dart';

Future<int?> typeMenu(BuildContext context, GlobalKey globalKey) async {
  return await showMenu<int?>(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(13.h),
    ),
    context: context,
    color: const Color(0xFFFBFDFF),
    surfaceTintColor: const Color(0xFFFBFDFF),
    position: position(globalKey, context),
    elevation: 10,
    constraints: BoxConstraints(minWidth: 350.w, minHeight: 396.h),
    items: [
      PopupMenuItem<int>(
        value: 0,
        height: 30.h,
        child: Text('Фрисби', style: context.s16w400.copyWith(color: const Color(0xFF007AFF))),
      ),
      const PopupMenuDivider(),
      PopupMenuItem<int>(
        value: 1,
        height: 30.h,
        child: Text('Аджилити', style: context.s16w400.copyWith(color: const Color(0xFF007AFF))),
      ),
      const PopupMenuDivider(),
      PopupMenuItem<int>(
        value: 2,
        height: 30.h,
        child: Text('Перетягивание каната', style: context.s16w400.copyWith(color: const Color(0xFF007AFF))),
      ),
      const PopupMenuDivider(),
      PopupMenuItem<int>(
        value: 3,
        height: 30.h,
        child: Text('Прятки', style: context.s16w400.copyWith(color: const Color(0xFF007AFF))),
      ),
      const PopupMenuDivider(),
      PopupMenuItem<int>(
        value: 4,
        height: 30.h,
        child: Text('Догонялки', style: context.s16w400.copyWith(color: const Color(0xFF007AFF))),
      ),
      const PopupMenuDivider(),
      PopupMenuItem<int>(
        value: 5,
        height: 30.h,
        child: Text('Исследование новых мест', style: context.s16w400.copyWith(color: const Color(0xFF007AFF))),
      ),
      const PopupMenuDivider(),
      PopupMenuItem<int>(
        value: 6,
        height: 30.h,
        child: Text('Пешие прогулки', style: context.s16w400.copyWith(color: const Color(0xFF007AFF))),
      ),
      const PopupMenuDivider(),
      PopupMenuItem<int>(
        value: 7,
        height: 30.h,
        child: Text('Велосипедные прогулки', style: context.s16w400.copyWith(color: const Color(0xFF007AFF))),
      ),
      const PopupMenuDivider(),
      PopupMenuItem<int>(
        value: 8,
        height: 30.h,
        child: Text('Поход', style: context.s16w400.copyWith(color: const Color(0xFF007AFF))),
      ),
    ],
  );
}
