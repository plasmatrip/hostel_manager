import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/fields/image_field.dart';
import 'package:hostel_manager/app/repository/room_repo.dart';
import 'package:provider/provider.dart';

class ImagesRow extends StatelessWidget {
  const ImagesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            for (int i = 2; i <= 5; i++) ...[
              ImageField(
                saveImage: (String image) {
                  switch (i) {
                    case 2:
                      context.read<RoomRepo>().image2 = image;
                    case 3:
                      context.read<RoomRepo>().image3 = image;
                    case 4:
                      context.read<RoomRepo>().image4 = image;
                    case 5:
                      context.read<RoomRepo>().image5 = image;
                  }
                },
                image: switch (i) {
                  2 => context.watch<RoomRepo>().image2,
                  3 => context.watch<RoomRepo>().image3,
                  4 => context.watch<RoomRepo>().image4,
                  _ => context.watch<RoomRepo>().image5,
                },
              ),
              SizedBox(width: 8.w),
            ],
          ],
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
