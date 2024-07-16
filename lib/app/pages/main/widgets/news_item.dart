import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/models/news.dart';

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
      onTap: () {},
      child: SizedBox(
        width: 311.w,
        height: 128.h,
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
                  width: 193.w,
                  child: Text(
                    news.title,
                    style: context.s15w400.copyWith(color: greyBlack),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: 193.w,
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
