import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/models/news.dart';

@RoutePage()
class SelectedNewsView extends StatelessWidget {
  const SelectedNewsView({required this.news, super.key});

  final News news;

  @override
  Widget build(BuildContext context) {
    final RegExp tag = RegExp(r'\[(?<=\[)[0-9A-Z\s]+(?=\])\]');
    RegExpMatch? match;
    List<Widget> content = [];

    for (int i = 0; i < news.content.length; i++) {
      match = tag.firstMatch(news.content[i]);
      if (match != null) {
        switch (match[0]) {
          case '[TITLE]':
            content.addAll([
              Text(news.title, style: context.s17w500.copyWith(color: greyBlack)),
              SizedBox(height: 12.h),
            ]);
          case '[TEXT]':
            content.addAll([
              Text(news.content[i].replaceAll(tag, ''), style: context.s14w400.copyWith(color: greyDark, height: 0)),
              SizedBox(height: 12.h),
            ]);
          case '[IMAGE]':
            content.addAll([
              Image.asset(news.image),
              SizedBox(height: 12.h),
            ]);
          case '[TIME]':
            content.addAll([
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  news.time,
                  style: context.s10w400.copyWith(color: greyGrey),
                ),
              ),
              SizedBox(height: 12.h),
            ]);
        }
      }
    }
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => AutoRouter.of(context).removeLast(),
          child: Icon(
            Icons.arrow_back_ios,
            color: colorsAcc,
            size: 24.h,
          ),
        ),
        title: const Text('Новости'),
        backgroundColor: bg,
        surfaceTintColor: bg,
        shadowColor: const Color(0x3FABB1B9),
        elevation: 10,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 92.h),
        child: Container(
          width: 335.w,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: ShapeDecoration(
            color: colors_2,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.1.h, color: greyGrey),
              borderRadius: BorderRadius.circular(8.h),
            ),
            shadows: [
              BoxShadow(
                color: const Color(0x3FABB1B9),
                blurRadius: 12.h,
                offset: Offset(0, 2.h),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: content,
          ),
        ),
      ),
    );
  }
}
