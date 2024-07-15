import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hostel_manager/app/app.dart';
import 'package:hostel_manager/app/internal/boxes.dart';
import 'package:hostel_manager/app/models/room.dart';
import 'package:hostel_manager/app/models/settings.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter<Settings>(SettingsAdapter());
  Hive.registerAdapter<Room>(RoomAdapter());

  await Hive.openBox<Settings>(Boxes.settings);
  await Hive.openBox<Room>(Boxes.room);

  // if (Hive.box<News>(Boxes.news).isEmpty) {
  //   await NewsData.addData();
  // }

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => initializeDateFormatting('ru', null).then(
      (_) => runApp(
        const App(),
      ),
    ),
  );
}
