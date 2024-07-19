import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hostel_manager/app/internal/boxes.dart';
import 'package:hostel_manager/app/models/booking.dart';
import 'package:hostel_manager/app/models/room.dart';
import 'package:hostel_manager/app/repository/room_repo.dart';

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
    calcSum();
    notifyListeners();
  }

  DateTime? get departure => _booking.departure;
  set departure(DateTime? value) {
    _booking.departure = value;
    calcSum();
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

  void addRoom(Room room, [bool notify = true]) {
    _booking.room ??= HiveList(Hive.box<Room>(Boxes.room));
    if (_booking.room!.isNotEmpty) {
      _booking.room!.clear();
    }
    _booking.room!.add(room);
    calcSum();
    if (notify) {
      notifyListeners();
    }
  }

  void clear() {
    _booking = Booking(comment: '', name: '', phone: '', email: '', sum: 0);
    editMode = false;
  }

  Future<void> save() async {
    Booking booking;
    if (editMode) {
      booking = repo.get(editKey);
      booking.copyWith(_booking);
      booking.save();
    } else {
      booking = Booking(comment: '', name: '', phone: '', email: '', sum: 0);
      booking.copyWith(_booking);
      repo.add(booking);
    }
    Room room = Hive.box<Room>(Boxes.room).get((_booking.room!.first as Room).key)!;
    room.status = Status.booked.index;
    room.booking ??= HiveList(repo);
    if (room.booking!.isNotEmpty) {
      room.booking!.clear();
    }
    room.booking!.add(booking);
    room.save();
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

  void calcSum() {
    if (_booking.arrival != null && _booking.departure != null && _booking.room != null) {
      _booking.sum = (_booking.departure!.difference(_booking.arrival!).inDays + 1) * (_booking.room!.first as Room).price;
    } else {
      _booking.sum = 0;
    }
  }
}
