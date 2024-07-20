import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hostel_manager/app/internal/boxes.dart';
import 'package:hostel_manager/app/internal/utils.dart';
import 'package:hostel_manager/app/models/task.dart';

class TaskRepo with ChangeNotifier {
  Box repo = Hive.box<Task>(Boxes.task);

  Task _task = Task(name: '', note: '');

  bool editMode = false;
  int editKey = 0;

  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;
  set selectedDate(DateTime value) {
    _selectedDate = value;
    notifyListeners();
  }

  String get name => _task.name;
  set name(String value) {
    _task.name = value;
    notifyListeners();
  }

  String get note => _task.note;
  set note(String value) {
    _task.note = value;
    notifyListeners();
  }

  DateTime? get date => _task.date;
  set date(DateTime? value) {
    _task.date = value;
    notifyListeners();
  }

  DateTime? get time => _task.time;
  set time(DateTime? value) {
    _task.time = value;
    notifyListeners();
  }

  bool get done => _task.done;
  set done(bool value) {
    _task.done = value;
    notifyListeners();
  }

  void clear() {
    _task = Task(name: '', note: '');
    editMode = false;
  }

  Future<void> save() async {
    if (editMode) {
      Task task = repo.get(editKey);
      task.copyWith(_task);
      task.save();
    } else {
      repo.add(_task);
    }
    clear();
    notifyListeners();
  }

  Future<void> delete(int key) async {
    Task task = repo.get(key);
    task.delete();
    notifyListeners();
  }

  void edit(int key) {
    _task.copyWith(repo.get(key));
    editMode = true;
    editKey = key;
  }

  bool canSave() {
    return _task.isNotEmpty();
  }

  Iterable tasks() {
    return repo.values.where((element) => datesIsEqual((element as Task).date, _selectedDate));
  }

  Future<void> setTaskDone(int taskKey) async {
    Task task = repo.get(taskKey);
    task.done = !task.done;
    task.save();
    notifyListeners();
  }

  Iterable taskByDate(DateTime date) {
    return repo.values.where((element) => datesIsEqual((element as Task).date, date));
  }
}
