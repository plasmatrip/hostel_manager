import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hostel_manager/app/internal/boxes.dart';
import 'package:hostel_manager/app/models/booking.dart';
import 'package:hostel_manager/app/models/room.dart';

class BookingRepo with ChangeNotifier {
  Box repo = Hive.box<Booking>(Boxes.booking);

  Booking _booking = Booking(comment: '', name: '', phone: '', email: '', sum: 0);

  bool editMode = false;
  int editKey = 0;

  String get name => _booking.name;
  set name(String value) {
    _booking.name = value;
    notifyListeners();
  }

  String get comment => _booking.comment;
  set comment(String value) {
    _booking.comment = value;
    notifyListeners();
  }

  String get phone => _booking.phone;
  set phone(String value) {
    _booking.phone = value;
    notifyListeners();
  }

  String get email => _booking.email;
  set email(String value) {
    _booking.email = value;
    notifyListeners();
  }

  int get sum => _booking.sum;
  set sum(int value) {
    _booking.sum = value;
    notifyListeners();
  }

  DateTime? get arrival => _booking.arrival;
  set arrival(DateTime? value) {
    _booking.arrival = value;
    notifyListeners();
  }

  DateTime? get departure => _booking.departure;
  set departure(DateTime? value) {
    _booking.departure = value;
    notifyListeners();
  }

  bool? get earlyCheckin => _booking.earlyCheckin;
  set earlyCheckin(bool? value) {
    _booking.earlyCheckin = value;
    notifyListeners();
  }

  bool? get breakfast => _booking.breakfast;
  set breakfast(bool? value) {
    _booking.breakfast = value;
    notifyListeners();
  }

  Room? getRoom() {
    if (_booking.room == null) {
      return null;
    }
    return _booking.room!.last as Room;
  }

  void addRoom(Room room) {
    _booking.room ??= HiveList(Hive.box<Room>(Boxes.room));
    if (_booking.room!.isNotEmpty) {
      _booking.room!.clear();
    }
    _booking.room!.add(room);
    notifyListeners();
  }

  void clear() {
    _booking = Booking(comment: '', name: '', phone: '', email: '', sum: 0);
    editMode = false;
  }

  Future<void> save() async {
    if (editMode) {
      Booking booking = repo.get(editKey);
      booking.copyWith(_booking);
      booking.save();
    } else {
      repo.add(_booking);
    }
    clear();
    notifyListeners();
  }

  Future<void> delete(int key) async {
    Booking booking = repo.get(key);
    booking.delete();
    notifyListeners();
  }

  void edit(int key) {
    _booking.copyWith(repo.get(key));
    editMode = true;
    editKey = key;
  }

  bool canSave() {
    return _booking.isNotEmpty();
  }
}
