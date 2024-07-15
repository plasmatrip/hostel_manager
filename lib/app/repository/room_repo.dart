import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hostel_manager/app/internal/boxes.dart';
import 'package:hostel_manager/app/models/room.dart';

enum Section { donated, received }

class RoomRepo with ChangeNotifier {
  Box repo = Hive.box<Room>(Boxes.room);

  Room _room = Room(images: [], name: '', price: 0, description: '');

  bool editMode = false;
  int editKey = 0;

  String get name => _room.name;
  set name(String value) {
    _room.name = value;
    notifyListeners();
  }

  String get description => _room.description;
  set description(String value) {
    _room.description = value;
    notifyListeners();
  }

  int get price => _room.price;
  set price(int value) {
    _room.price = value;
    notifyListeners();
  }

  int? get section => _room.section;
  set section(int? value) {
    _room.section = value;
    notifyListeners();
  }

  void clear() {
    _room = Room(images: [], name: '', price: 0, description: '');
    editMode = false;
  }

  Future<void> save() async {
    if (editMode) {
      Room room = repo.get(editKey);
      room.copyWith(_room);
      room.save();
    } else {
      repo.add(_room);
    }
    clear();
    notifyListeners();
  }

  Future<void> delete(int key) async {
    Room room = repo.get(key);
    room.delete();
    notifyListeners();
  }

  void edit(int key) {
    _room.copyWith(repo.get(key));
    editMode = true;
    editKey = key;
  }

  bool canSave() {
    return _room.isNotEmpty();
  }
}
