import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/models/news.dart';
import 'package:hostel_manager/app/routing/app_router.gr.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    required this.news,
    super.key,
  });

  final News news;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async => AutoRouter.of(context).push(SelectedNewsView(news: news)),
      child: Container(
        width: 335.w,
        height: 152.h,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(news.icon, width: 90.w),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(news.time, style: context.s10w400.copyWith(color: greyGrey)),
                SizedBox(
                  width: 209.w,
                  child: Text(
                    news.title,
                    style: context.s15w400.copyWith(color: greyBlack),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: 209.w,
                  child: Text(
                    news.subTitle,
                    style: context.s13w400.copyWith(color: greyDark),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
