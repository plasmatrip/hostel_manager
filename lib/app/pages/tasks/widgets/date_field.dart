// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:intl/intl.dart';
// import 'package:pet_adventure_planer/app/internal/ui.dart';
// import 'package:pet_adventure_planer/app/pages/widgets/date_dialog.dart';
// import 'package:pet_adventure_planer/app/repository/album_repo.dart';
// import 'package:provider/provider.dart';

// class DateField extends StatelessWidget {
//   const DateField({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       behavior: HitTestBehavior.opaque,
//       onTap: () async {
//         var result = await dateDialog(context, context.read<AlbumRepo>().date);
//         if (result != null && context.mounted) {
//           context.read<AlbumRepo>().date = result;
//         }
//       },
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Text('Дата', style: context.s12w700.copyWith(color: const Color(0xFF1C1C1C))),
//           Container(
//             width: 350.w,
//             height: 40.h,
//             padding: EdgeInsets.only(
//               top: 8.h,
//               left: 12.w,
//               right: 12.w,
//               bottom: 10.h,
//             ),
//             decoration: ShapeDecoration(
//               shape: RoundedRectangleBorder(
//                 side: BorderSide(
//                   width: 0.5.h,
//                   color: context.watch<AlbumRepo>().date == null ? const Color(0x4C1C1C1C) : const Color(0xFF007AFF),
//                 ),
//                 borderRadius: BorderRadius.circular(12.h),
//               ),
//             ),
//             child: Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   context.watch<AlbumRepo>().date == null
//                       ? Text(
//                           'Выберите дату',
//                           style: context.s16w400.copyWith(color: Colors.black38, letterSpacing: -0.5.w),
//                         )
//                       : Text(
//                           DateFormat('dd.MM.y', 'ru').format(context.read<AlbumRepo>().date!),
//                           style: context.s16w400.copyWith(color: const Color(0xFF007AFF), letterSpacing: -0.5.w),
//                         ),
//                   SvgPicture.asset(
//                     context.watch<AlbumRepo>().date == null ? 'assets/icons/calendar.circle.fill.svg' : 'assets/icons/calendar.circle.fill blue.svg',
//                     width: 22.w,
//                     height: 22.h,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 12.h),
//         ],
//       ),
//     );
//   }
// }
