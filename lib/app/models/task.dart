import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 2)
class Task extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  DateTime? date;

  @HiveField(2)
  DateTime? time;

  @HiveField(3)
  String note;

  @HiveField(4)
  bool done;

  bool isNotEmpty() {
    return name.isNotEmpty && date != null && time != null && note.isNotEmpty;
  }

  void copyWith(Task task) {
    name = task.name;
    date = task.date;
    time = task.time;
    note = task.note;
    done = task.done;
  }

  Task({
    required this.name,
    required this.note,
    this.date,
    this.time,
    this.done = false,
  });
}
