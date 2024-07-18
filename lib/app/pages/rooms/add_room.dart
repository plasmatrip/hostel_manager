import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/widgets/delete_dalog.dart';
import 'package:hostel_manager/app/internal/widgets/edit_delete_dialog.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/fields/bath_accessories_field.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/fields/bed_filed.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/fields/description_field.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/fields/floor_field.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/fields/images_row.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/fields/main_image_field.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/fields/name_field.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/fields/price_field.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/fields/status_field.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/fields/toilet_field.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/fields/view_field.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/fields/wifi_field.dart';
import 'package:hostel_manager/app/pages/rooms/widgets/save_button.dart';
import 'package:hostel_manager/app/repository/room_repo.dart';
import 'package:hostel_manager/app/routing/app_router.gr.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AddRoom extends StatelessWidget {
  const AddRoom({super.key, this.roomKey});

  final int? roomKey;

  @override
  Widget build(BuildContext context) {
    if (roomKey != null) {
      context.read<RoomRepo>().edit(roomKey!);
    }
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () async {
              if (context.read<RoomRepo>().editMode) {
                context.read<RoomRepo>().clear();
                AutoRouter.of(context).replace(SelectedRoomView(roomKey: roomKey!));
              } else {
                context.read<RoomRepo>().clear();
                AutoRouter.of(context).removeLast();
              }
            },
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
                onTap: () async {
                  if (context.read<RoomRepo>().editMode) {
                    var result = await deleteDialog(context, 'Вы действительно хотите удалить и комнату?');
                    if (result != null) {
                      if (result == 'DELETE' && context.mounted) {
                        context.read<RoomRepo>().delete(roomKey!);
                        context.read<RoomRepo>().clear();
                        if (context.read<RoomRepo>().repo.isEmpty) {
                          AutoRouter.of(context).navigate(const MainView());
                        } else {
                          AutoRouter.of(context).removeLast();
                        }
                      }
                    }
                  } else {
                    context.read<RoomRepo>().clear();
                    AutoRouter.of(context).removeLast();
                  }
                },
                child: SvgPicture.asset(
                  'assets/icons/Close Circle.svg',
                  width: 24.h,
                  height: 24.h,
                ),
              ),
            ),
          ],
          title: context.read<RoomRepo>().editMode ? const Text('Редактирование данных') : const Text('Новая комната'),
          backgroundColor: bg,
          surfaceTintColor: bg,
          shadowColor: const Color(0x3FABB1B9),
          elevation: 10,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 92.h),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: MainImageField(),
                ),
                ImagesRow(),
                NameField(),
                PriceField(),
                DescriptionField(),
                StatusField(),
                FloorField(),
                BedField(),
                ViewField(),
                WifiField(),
                BathAccessoriesField(),
                ToiletField(),
                SaveButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
