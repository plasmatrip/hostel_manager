import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:hostel_manager/app/internal/boxes.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/models/news.dart';
import 'package:hostel_manager/app/pages/main/widgets/news_item.dart';
import 'package:hostel_manager/app/routing/app_router.gr.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  late Iterable newsList;
  PageController controller = PageController();

  @override
  void initState() {
    newsList = Hive.box<News>(Boxes.news).values;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      height: 200.h,
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
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () async => AutoRouter.of(context).push(const NewsView()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Новости',
                  style: context.s20w500.copyWith(color: greyBlack),
                ),
                SvgPicture.asset(
                  'assets/icons/Round Arrow Right.svg',
                  width: 24.h,
                  height: 24.h,
                )
              ],
            ),
          ),
          Divider(color: greyLight, thickness: 0.2.h, height: 14.h),
          SizedBox(
            width: 311.w,
            height: 128.h,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ListView.separated(
                    controller: controller,
                    padding: EdgeInsets.zero,
                    itemCount: newsList.length,
                    separatorBuilder: (context, index) => SizedBox(height: 12.h),
                    itemBuilder: (context, index) {
                      News news = newsList.elementAt(index);
                      return NewsItem(news: news);
                    },
                  ),
                ),
                SizedBox(width: 12.w),
                SmoothPageIndicator(
                  axisDirection: Axis.vertical,
                  controller: controller,
                  count: newsList.length,
                  effect: ExpandingDotsEffect(
                    dotWidth: 4.h,
                    dotHeight: 4.h,
                    radius: 4.h,
                    spacing: 5.h,
                    dotColor: greyGrey,
                    activeDotColor: colorsAcc,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
