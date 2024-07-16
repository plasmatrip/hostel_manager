import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hostel_manager/app/internal/boxes.dart';
import 'package:hostel_manager/app/models/room.dart';

enum Status { vacancies, booked, cleaning, repair }

enum Floor { first, second, third, fourth }

enum Bed { double, single, threeBeds, twoBeds, kingSize, multipleBeds }

enum View { sea, garden, city, mall }

class RoomRepo with ChangeNotifier {
  Box repo = Hive.box<Room>(Boxes.room);

  Room _room = Room(image1: '', image2: '', image3: '', image4: '', image5: '', name: '', price: 0, description: '');

  bool editMode = false;
  int editKey = 0;

  String get name => _room.name;
  set name(String value) {
    _room.name = value;
    notifyListeners();
  }

  String get image1 => _room.image1;
  set image1(String value) {
    _room.image1 = value;
    notifyListeners();
  }

  String get image2 => _room.image2;
  set image2(String value) {
    _room.image2 = value;
    notifyListeners();
  }

  String get image3 => _room.image3;
  set image3(String value) {
    _room.image3 = value;
    notifyListeners();
  }

  String get image4 => _room.image4;
  set image4(String value) {
    _room.image4 = value;
    notifyListeners();
  }

  String get image5 => _room.image5;
  set image5(String value) {
    _room.image5 = value;
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

  int? get status => _room.status;
  set status(int? value) {
    _room.status = value;
    notifyListeners();
  }

  int? get floor => _room.floor;
  set floor(int? value) {
    _room.status = value;
    notifyListeners();
  }

  int? get bed => _room.bed;
  set bed(int? value) {
    _room.bed = value;
    notifyListeners();
  }

  int? get view => _room.view;
  set view(int? value) {
    _room.view = value;
    notifyListeners();
  }

  bool? get wifi => _room.wifi;
  set wifi(bool? value) {
    _room.wifi = value;
    notifyListeners();
  }

  bool? get toilet => _room.toilet;
  set toilet(bool? value) {
    _room.toilet = value;
    notifyListeners();
  }

  bool? get bathAccessories => _room.bathAccessories;
  set bathAccessories(bool? value) {
    _room.bathAccessories = value;
    notifyListeners();
  }

  void clear() {
    _room = Room(image1: '', image2: '', image3: '', image4: '', image5: '', name: '', price: 0, description: '');
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
