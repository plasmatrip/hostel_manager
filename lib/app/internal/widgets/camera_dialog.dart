// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gifts/app/internal/colors.dart';
// import 'package:gifts/app/internal/ui.dart';

// Future<String?> cameraDialog(BuildContext context) {
//   return showDialog<String>(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.h)),
//         backgroundColor: bg,
//         surfaceTintColor: bg,
//         shadowColor: const Color(0x66000000),
//         actionsPadding: EdgeInsets.zero,
//         actionsAlignment: MainAxisAlignment.center,
//         content: SizedBox(
//           // width: 100.w,
//           height: 125.h,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               FilledButton(
//                 onPressed: () => Navigator.of(context).pop('Camera'),
//                 style: context.extraBtn,
//                 child: const Text('Камера'),
//               ),
//               FilledButton(
//                 onPressed: () => Navigator.of(context).pop('Galery'),
//                 style: context.extraBtn,
//                 child: const Text('Галерея'),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
// // 