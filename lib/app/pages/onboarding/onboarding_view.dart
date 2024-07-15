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
        if ((controller.page ?? 0) > 0) {
          setState(
            () {
              start = true;
            },
          );
        }
      case ScrollDirection.forward:
        if ((controller.page ?? 0) < 1) {
          setState(
            () {
              start = false;
            },
          );
        }
      case ScrollDirection.idle:
        if ((controller.page ?? 0) >= 1) {
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              children: const [
                Page1(),
                Page2(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SizedBox(height: 21.h),
                if (start) ...[
                  FilledButton(
                    onPressed: () async {
                      Settings settings = Hive.box<Settings>(Boxes.settings).getAt(0)!;
                      settings.showOnboarding = false;
                      settings.save();
                      AutoRouter.of(context).replace(const MainView());
                    },
                    style: context.extraBtn.copyWith(
                      minimumSize: WidgetStatePropertyAll(Size(327.w, 36.h)),
                      maximumSize: WidgetStatePropertyAll(Size(327.w, 36.h)),
                      textStyle: WidgetStatePropertyAll(context.s16w600),
                    ),
                    child: Text(start ? 'Начать' : 'Продолжить'),
                  ),
                ] else ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FilledButton(
                        onPressed: () async => AutoRouter.of(context).replace(const MainView()),
                        style: context.btnCanel.copyWith(
                          minimumSize: WidgetStatePropertyAll(Size(156.w, 36.h)),
                          maximumSize: WidgetStatePropertyAll(Size(156.w, 36.h)),
                        ),
                        child: const Text('Пропустить'),
                      ),
                      FilledButton(
                        onPressed: () async => controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        ),
                        style: context.btnOk.copyWith(
                          minimumSize: WidgetStatePropertyAll(Size(156.w, 36.h)),
                          maximumSize: WidgetStatePropertyAll(Size(156.w, 36.h)),
                        ),
                        child: const Text('Продолжить'),
                      ),
                    ],
                  ),
                ],
                SizedBox(height: 16.h),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 153.w,
                        child: Text(
                          'Условия использования',
                          style: context.s9w400i.copyWith(color: stroke),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      VerticalDivider(color: acc, thickness: 0.5.w, width: 20.w),
                      SizedBox(
                        width: 153.w,
                        child: Text(
                          'Политика конфиденциальности',
                          style: context.s9w400i.copyWith(color: stroke),
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
