import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:hostel_manager/app/internal/boxes.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/internal/utils.dart';
import 'package:hostel_manager/app/models/settings.dart';
import 'package:in_app_review/in_app_review.dart';

@RoutePage()
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => AutoRouter.of(context).removeLast(),
          child: SvgPicture.asset(
            'assets/icons/Round Arrow Left.svg',
            width: 24.w,
            height: 24.w,
            fit: BoxFit.none,
          ),
        ),
        // titleSpacing: 24.w,
        title: const Text('Настройки'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Container(
            height: 8.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.h),
                bottomRight: Radius.circular(8.h),
              ),
              border: Border(
                bottom: BorderSide(width: 1.h, color: greyDark),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () async => openUrl(Hive.box<Settings>(Boxes.settings).getAt(0)!.privacyPolicyUri),
              child: Container(
                width: 335.w,
                height: 48.h,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: bg,
                  borderRadius: BorderRadius.circular(8.h),
                  boxShadow: [
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
                    SvgPicture.asset('assets/icons/Bag.svg', width: 24.w, height: 24.h),
                    Text('Политика конфиденциальности', style: context.s15w400.copyWith(color: greyDark, letterSpacing: -0.5.w)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () async => openUrl(Hive.box<Settings>(Boxes.settings).getAt(0)!.termsOfUseUri),
              child: Container(
                width: 335.w,
                height: 48.h,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: bg,
                  borderRadius: BorderRadius.circular(8.h),
                  boxShadow: [
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
                    SvgPicture.asset('assets/icons/Document Text.svg', width: 24.w, height: 24.h),
                    Text('Пользовательское соглашение', style: context.s15w400.copyWith(color: greyDark, letterSpacing: -0.5.w)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 32.h),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () async {
                final InAppReview inAppReview = InAppReview.instance;
                if (await inAppReview.isAvailable()) {
                  await inAppReview.requestReview();
                }
              },
              child: Container(
                width: 335.w,
                height: 48.h,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: bg,
                  borderRadius: BorderRadius.circular(8.h),
                  boxShadow: [
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
                    SvgPicture.asset('assets/icons/Heart.svg', width: 24.w, height: 24.h),
                    Text('Оценить приложение', style: context.s14w500.copyWith(color: greyDark, letterSpacing: -0.5.w)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
