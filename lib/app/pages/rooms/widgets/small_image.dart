import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hostel_manager/app/internal/boxes.dart';
import 'package:hostel_manager/app/models/settings.dart';

class SmallImage extends StatelessWidget {
  const SmallImage({
    required this.image,
    super.key,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64.h,
      height: 64.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.h),
        image: DecorationImage(image: FileImage(File('${Hive.box<Settings>(Boxes.settings).getAt(0)!.appDir}/$image')), fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(
            color: const Color(0x3FABB1B9),
            blurRadius: 12.h,
            offset: Offset(0, 2.h),
            spreadRadius: 0,
          )
        ],
      ),
    );
  }
}
