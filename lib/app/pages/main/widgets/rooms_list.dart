import 'package:flutter/material.dart';
import 'package:hostel_manager/app/internal/colors.dart';
import 'package:hostel_manager/app/internal/ui.dart';

class RoomsList extends StatelessWidget {
  const RoomsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Свободные номера', style: context.s20w500.copyWith(color: greyBlack)),
            Text('Все номера', style: context.textUnderline),
          ],
        )
      ],
    );
  }
}
