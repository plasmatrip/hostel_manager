import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hostel_manager/app/internal/boxes.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/models/settings.dart';
import 'package:hostel_manager/app/pages/onboarding/widgets/page1.dart';
import 'package:hostel_manager/app/pages/onboarding/widgets/page2.dart';
import 'package:hostel_manager/app/pages/onboarding/widgets/page3.dart';
import 'package:hostel_manager/app/routing/app_router.gr.dart';

@RoutePage()
class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController controller = PageController();
  bool start = false;

  void listener() {
    switch (controller.position.userScrollDirection) {
      case ScrollDirection.reverse:
        if ((controller.page ?? 0) > 1) {
          setState(
            () {
              start = true;
            },
          );
        }
      case ScrollDirection.forward:
        if ((controller.page ?? 0) < 2) {
          setState(
            () {
              start = false;
            },
          );
        }
      case ScrollDirection.idle:
        if ((controller.page ?? 0) >= 2) {
          setState(
            () {
              start = true;
            },
          );
        }
    }
  }

  @override
  void initState() {
    controller.addListener(listener);
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(listener);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              children: const [
                Page1(),
                Page2(),
                Page3(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (start) ...[
                  FilledButton(
                    onPressed: () async {
                      Settings settings = Hive.box<Settings>(Boxes.settings).getAt(0)!;
                      settings.showOnboarding = false;
                      settings.save();
                      AutoRouter.of(context).replace(const MainView());
                    },
                    style: context.extraBtn,
                    child: const Text('Начать'),
                  ),
                ] else ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FilledButton(
                        onPressed: () async => AutoRouter.of(context).replace(const MainView()),
                        style: context.btnCanel.copyWith(
                          minimumSize: WidgetStatePropertyAll(Size(156.w, 40.h)),
                          maximumSize: WidgetStatePropertyAll(Size(156.w, 40.h)),
                        ),
                        child: Text(
                          'Пропустить',
                          style: context.s17w500.copyWith(color: colorsAcc),
                        ),
                      ),
                      FilledButton(
                        onPressed: () async => controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        ),
                        style: context.btnOk.copyWith(
                          minimumSize: WidgetStatePropertyAll(Size(156.w, 40.h)),
                          maximumSize: WidgetStatePropertyAll(Size(156.w, 40.h)),
                        ),
                        child: Text(
                          'Далее',
                          style: context.s17w500.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
                SizedBox(height: 16.h),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 157.w,
                        child: Text(
                          'Условия использования',
                          style: context.s10w400.copyWith(color: greyGrey, letterSpacing: -0.3.w),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      VerticalDivider(color: colorsAcc, thickness: 0.5.w, width: 20.w),
                      SizedBox(
                        width: 157.w,
                        child: Text(
                          'Политика конфиденциальности',
                          style: context.s10w400.copyWith(color: greyGrey, letterSpacing: -0.3.w),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
