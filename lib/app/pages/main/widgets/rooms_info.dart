import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';

class RoomsInfo extends StatelessWidget {
  const RoomsInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 335.w,
          height: 93.w,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/Subtract.png'),
            ),
          ),
        ),
        Positioned(
          left: 4.w,
          child: SizedBox(
            width: 89.w,
            height: 89.w,
            child: CircularProgressIndicator(
              value: 0.7,
              color: colorsAcc,
              backgroundColor: colors_4,
              strokeCap: StrokeCap.round,
              strokeWidth: 6.w,
            ),
          ),
        ),
      ],
    );
  }
}
