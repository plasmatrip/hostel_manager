import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:hostel_manager/app/internal/boxes.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/widgets/alert_dialog.dart';
import 'package:hostel_manager/app/internal/widgets/camera_dialog.dart';
import 'package:hostel_manager/app/models/settings.dart';
import 'package:hostel_manager/app/repository/room_repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class ImageField extends StatelessWidget {
  const ImageField({required this.saveImage, required this.image, super.key});

  final void Function(String) saveImage;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async {
            final imagePicker = ImagePicker();
            final XFile? image;
            var result = await cameraDialog(context);
            if (result != null) {
              try {
                image = await imagePicker.pickImage(source: result == 'Galery' ? ImageSource.gallery : ImageSource.camera);
                if (image != null) {
                  final Directory applicationDirectory = await getApplicationDocumentsDirectory();
                  final String fileName = '${applicationDirectory.path}/${image.name}';
                  await image.saveTo(fileName);
                  if (context.mounted) {
                    saveImage(image.name);
                    // context.read<RoomRepo>().image1 = image.name;
                  }
                }
              } catch (e) {
                var message = 'Unknown error.';
                if (e is PlatformException) {
                  message = e.message ?? 'Unknown error.';
                }
                if (context.mounted) {
                  result = await alertDialog(context, message);
                }
              }
            }
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 64.h,
                height: 64.h,
                decoration: image.isNotEmpty
                    // decoration: context.watch<RoomRepo>().image1.isNotEmpty
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(12.h),
                        image: DecorationImage(
                            //image: FileImage(File('${Hive.box<Settings>(Boxes.settings).getAt(0)!.appDir}/${context.read<RoomRepo>().image1}')),
                            image: FileImage(File('${Hive.box<Settings>(Boxes.settings).getAt(0)!.appDir}/$image')),
                            fit: BoxFit.cover),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x3FABB1B9),
                            blurRadius: 12.h,
                            offset: Offset(0, 2.h),
                            spreadRadius: 0,
                          )
                        ],
                      )
                    : ShapeDecoration(
                        color: bg,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.h)),
                        shadows: [
                          BoxShadow(
                            color: const Color(0x3FABB1B9),
                            blurRadius: 12.h,
                            offset: Offset(0, 2.h),
                            spreadRadius: 0,
                          )
                        ],
                      ),
              ),
              if (image.isEmpty) ...[
                // if (context.read<RoomRepo>().image1.isEmpty) ...[
                SvgPicture.asset('assets/icons/camera 1.svg', width: 34.w, height: 24.h),
              ]
            ],
          ),
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
