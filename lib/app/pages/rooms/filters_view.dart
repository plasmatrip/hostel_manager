import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/filters/bed_filters.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/filters/floor_filters.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/filters/status_filters.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/filters/toilet_filters.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/filters/view_filters.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/filters/wifi_filters.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/search_block.dart';
import 'package:hostel_manager/app/repository/room_repo.dart';
import 'package:provider/provider.dart';

@RoutePage()
class FiltersView extends StatelessWidget {
  const FiltersView({super.key});

  @override
  Widget build(BuildContext context) {
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
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                if (context.read<RoomRepo>().editMode) {
                } else {
                  context.read<RoomRepo>().clear();
                  AutoRouter.of(context).removeLast();
                }
              },
              child: SvgPicture.asset('assets/icons/Close Circle.svg', width: 24.h, height: 24.h),
            ),
          ),
        ],
        title: const Text('Фильтры'),
        backgroundColor: bg,
        surfaceTintColor: bg,
        shadowColor: const Color(0x3FABB1B9),
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 92.h),
          child: Column(
            children: [
              SearchBlock(width: 335.w),
              SizedBox(height: 40.h),
              const StatusFilters(),
              SizedBox(height: 12.h),
              const FloorFilters(),
              SizedBox(height: 12.h),
              const BedFilters(),
              SizedBox(height: 12.h),
              const ViewFilters(),
              SizedBox(height: 12.h),
              const WifiFilters(),
              SizedBox(height: 12.h),
              const ToiletFilters(),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FilledButton(
        onPressed: context.watch<RoomRepo>().haveFilter() ? () {} : null,
        style: context.extraBtn,
        child: const Text('Применить'),
      ),
    );
  }
}
