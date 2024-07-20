import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hostel_manager/app/internal/boxes.dart';
import 'package:hostel_manager/app/internal/utils.dart';
import 'package:hostel_manager/app/models/booking.dart';
import 'package:hostel_manager/app/models/room.dart';
import 'package:hostel_manager/app/repository/room_repo.dart';
import 'package:jiffy/jiffy.dart';

const monthName = ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'];

class BookingRepo with ChangeNotifier {
  Box repo = Hive.box<Booking>(Boxes.booking);

  Booking _booking = Booking(comment: '', name: '', phone: '', email: '', sum: 0);

  bool editMode = false;
  int editKey = 0;

  DateTime _selectedDate = DateTime.now();
  DateTime _selectedMonth = DateTime.now();

  DateTime get selectedDate => _selectedDate;
  set selectedDate(DateTime value) {
    _selectedDate = value;
    notifyListeners();
  }

  DateTime get selectedMonth => _selectedMonth;
  set selectedMonth(DateTime value) {
    _selectedMonth = value;
    notifyListeners();
  }

  String _searchString = '';

  String get searchString => _searchString;
  set searchString(String value) {
    _searchString = value;
    notifyListeners();
  }

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
    if (booking.room != null) {
      if (booking.room!.isNotEmpty) {
        Room room = Hive.box<Room>(Boxes.room).get((booking.room!.last as Room).key)!;
        if (room.booking != null) {
          if (room.booking!.isNotEmpty) {
            if ((room.booking!.last as Booking).key == booking.key) {
              room.booking!.clear();
              room.status = Status.vacancies.index;
              room.save();
            }
          }
        }
      }
    }
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

  Iterable bookedForDay() {
    return repo.values.where((element) =>
        dateInRange(_selectedDate, (element as Booking).arrival, element.departure) &&
        (_searchString.isEmpty ? true : (element.room!.last as Room).name.contains(_searchString)));
  }

  bool roomReservedByDate(DateTime date) {
    if (_booking.room == null) {
      return false;
    }
    return repo.values.any((element) =>
        ((element as Booking).room!.last as Room).key == (_booking.room!.last as Room).key && dateInRange(date, element.arrival, element.departure));
  }

  bool roomReserved(Room room) {
    if (_booking.arrival == null || _booking.departure == null) {
      return false;
    }
    bool res = false;
    if (_booking.arrival != null) {
      res = repo.values.any((element) => (element.room.last as Room).key == room.key && dateInRange(_booking.arrival, element.arrival, element.departure));
    }
    if (res) {
      return true;
    }
    if (_booking.departure != null) {
      res = repo.values.any((element) => (element.room.last as Room).key == room.key && dateInRange(_booking.departure, element.arrival, element.departure));
    }
    if (res) {
      return true;
    }
    if (_booking.arrival != null && _booking.departure != null) {
      res = repo.values.any((element) =>
          ((element as Booking).room!.last as Room).key == room.key &&
          (dateInRange(element.arrival, _booking.arrival, _booking.departure) || dateInRange(element.departure, _booking.arrival, _booking.departure)));
    }
    if (res) {
      return true;
    }
    return false;
  }

  ({Map<int, bool> bookedDays, Iterable bookingList}) bookedDays(int roomKey) {
    Iterable bookingList = repo.values.where((element) =>
        ((element as Booking).arrival!.month == _selectedMonth.month || element.departure!.month == _selectedMonth.month) &&
        (element.room!.last as Room).key == roomKey);
    Map<int, bool> bookedDays = {};
    for (Booking booking in bookingList) {
      DateTime start;
      DateTime end;
      if (booking.arrival!.month < _selectedMonth.month) {
        start = DateTime(_selectedMonth.year, selectedMonth.month, 1);
      } else {
        start = booking.arrival!;
      }
      if (booking.departure!.month > _selectedMonth.month) {
        end = DateTime(_selectedMonth.year, selectedMonth.month, Jiffy.parseFromDateTime(_selectedMonth).daysInMonth);
      } else {
        end = booking.departure!;
      }
      for (int i = start.day; i <= end.day; i++) {
        bookedDays[i] = true;
      }
    }
    return (bookedDays: bookedDays, bookingList: bookingList);
  }
}
