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
                height: 52.h,
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                decoration: ShapeDecoration(
                  color: sec,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.h)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Политика конфиденциальности', style: context.s14w500.copyWith(color: greyDark, letterSpacing: -0.5.w)),
                    SvgPicture.asset('assets/icons/Lock.svg', width: 254.w, height: 24.h),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () async => openUrl(Hive.box<Settings>(Boxes.settings).getAt(0)!.termsOfUseUri),
              child: Container(
                width: 335.w,
                height: 52.h,
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                decoration: ShapeDecoration(
                  color: sec,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.h)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Пользовательское соглашение', style: context.s14w500.copyWith(color: greyDark, letterSpacing: -0.5.w)),
                    SvgPicture.asset('assets/icons/Diploma Verified.svg', width: 254.w, height: 24.h),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40.h),
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
                height: 52.h,
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                decoration: ShapeDecoration(
                  color: sec,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.h)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Оценить приложение', style: context.s14w500.copyWith(color: greyDark, letterSpacing: -0.5.w)),
                    SvgPicture.asset('assets/icons/Heart.svg', width: 254.w, height: 24.h),
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
