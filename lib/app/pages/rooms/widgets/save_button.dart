import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hostel_manager/app/internal/ui.dart';
import 'package:hostel_manager/app/repository/room_repo.dart';
import 'package:provider/provider.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: context.watch<RoomRepo>().canSave()
          ? () async {
              context.read<RoomRepo>().save();
              AutoRouter.of(context).maybePop(true);
            }
          : null,
      style: context.extraBtn,
      child: const Text('Сохранить'),
    );
  }
}
