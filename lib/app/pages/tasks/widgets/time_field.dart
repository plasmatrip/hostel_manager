// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pet_adventure_planer/app/internal/ui.dart';
// import 'package:pet_adventure_planer/app/repository/planer_repo.dart';
// import 'package:provider/provider.dart';

// class TimeField extends StatefulWidget {
//   const TimeField({
//     super.key,
//   });

//   @override
//   State<TimeField> createState() => _TimeFieldState();
// }

// class _TimeFieldState extends State<TimeField> {
//   late TextEditingController controller;

//   @override
//   void initState() {
//     controller = TextEditingController(text: context.read<PlanerRepo>().time);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Text('Время', style: context.s12w700.copyWith(color: Colors.black)),
//         Container(
//           width: 350.w,
//           height: 40.h,
//           padding: EdgeInsets.only(
//             top: 8.h,
//             left: 12.w,
//             right: 12.w,
//             bottom: 10.h,
//           ),
//           decoration: ShapeDecoration(
//             shape: RoundedRectangleBorder(
//               side: BorderSide(
//                 width: 0.5.h,
//                 color: context.watch<PlanerRepo>().time.isEmpty ? const Color(0x4C1C1C1C) : const Color(0xFF007AFF),
//               ),
//               borderRadius: BorderRadius.circular(12.h),
//             ),
//           ),
//           child: TextField(
//             controller: controller,
//             keyboardType: TextInputType.number,
//             inputFormatters: [
//               TextInputFormatter.withFunction((oldValue, newValue) {
//                 final regExp = RegExp(r'^\d*\:?\d*');
//                 final String newString = regExp.stringMatch(newValue.text) ?? '';
//                 return newString == newValue.text ? newValue : oldValue;
//               }),
//               LengthLimitingTextInputFormatter(5)
//             ],
//             onChanged: (value) => context.read<PlanerRepo>().time = value,
//             style: context.s16w400.copyWith(color: const Color(0xFF007AFF), letterSpacing: -0.5.w),
//             decoration: InputDecoration.collapsed(
//               border: InputBorder.none,
//               hintText: 'Введите цифры ЧЧ:ММ',
//               hintStyle: context.s16w400.copyWith(color: Colors.black45, letterSpacing: -0.5.w),
//             ),
//           ),
//         ),
//         SizedBox(height: 12.h),
//       ],
//     );
//   }
// }
