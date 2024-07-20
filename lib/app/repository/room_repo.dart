import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hostel_manager/app/internal/boxes.dart';
import 'package:hostel_manager/app/models/booking.dart';
import 'package:hostel_manager/app/models/room.dart';

enum Status {
  vacancies(mask: 0x1),
  booked(mask: 0x2),
  cleaning(mask: 0x4),
  repair(mask: 0x8);

  const Status({
    required this.mask,
  });

  final int mask;
}

enum Floor {
  first(mask: 0x1),
  second(mask: 0x2),
  third(mask: 0x4),
  fourth(mask: 0x8);

  const Floor({
    required this.mask,
  });

  final int mask;
}

enum Bed {
  double(mask: 0x1),
  threeBeds(mask: 0x2),
  single(mask: 0x4),
  twoBeds(mask: 0x8),
  kingSize(mask: 0x16),
  multipleBeds(mask: 0x32);

  const Bed({
    required this.mask,
  });

  final int mask;
}

enum RoomView {
  sea(mask: 0x1),
  garden(mask: 0x2),
  city(mask: 0x4),
  mall(mask: 0x8);

  const RoomView({
    required this.mask,
  });

  final int mask;
}

const List<String> status = ['Свободна', 'Занята', 'Уборка', 'Ремонт'];

const List<String> bed = ['1 двуспальная кровать', '3 кровати', '1 односпальная кровать', '2 кровати', 'Кровать “king-size”', 'Несколько кроватей'];

const List<String> view = ['Sea view', 'Garden view', 'City view', 'Mall view'];

class RoomRepo with ChangeNotifier {
  Box repo = Hive.box<Room>(Boxes.room);

  Room _room = Room(image1: '', image2: '', image3: '', image4: '', image5: '', name: '', price: 0, description: '');

  bool editMode = false;
  int editKey = 0;

  String _searchString = '';

  String get searchString => _searchString;
  set searchString(String value) {
    _searchString = value;
    notifyListeners();
  }

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
    _room.floor = value;
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

  Iterable vacancies() {
    checkExpiredReservation();
    return repo.values.where((element) => (element as Room).status == Status.vacancies.index);
  }

  void checkExpiredReservation() async {
    for (Room room in repo.values) {
      if (room.status == Status.booked.index) {
        if (room.booking != null) {
          if (room.booking!.isNotEmpty) {
            if ((room.booking!.last as Booking).departure!.isBefore(DateTime.now())) {
              room.status = Status.vacancies.index;
              room.save();
            }
          }
        }
      }
    }
  }

  Iterable rooms([bool booking = false]) {
    checkExpiredReservation();
    Iterable rooms = repo.values.where((element) => _searchString.isEmpty ? true : element.name.contains(_searchString));
    if (booking) {
      rooms = rooms.where((element) => booking ? element.status == Status.vacancies.index : true);
    }

    if (_useFilters) {
      rooms = rooms.where((element) => _toiletFilterUse == null ? true : (element as Room).toilet == _toiletFilterUse);
      rooms = rooms.where((element) => _wifiFilterUse == null ? true : element.wifi == _wifiFilterUse);

      if (_viewFilterUse != 0) {
        if (_viewFilterUse & RoomView.sea.mask == RoomView.sea.mask) {
          rooms = rooms.where((element) => element.view == RoomView.sea.index);
        }
        if (_viewFilterUse & RoomView.garden.mask == RoomView.garden.mask) {
          rooms = rooms.where((element) => element.view == RoomView.garden.index);
        }
        if (_viewFilterUse & RoomView.city.mask == RoomView.city.mask) {
          rooms = rooms.where((element) => element.view == RoomView.city.index);
        }
        if (_viewFilterUse & RoomView.mall.mask == RoomView.mall.mask) {
          rooms = rooms.where((element) => element.view == RoomView.mall.index);
        }
      }

      if (_bedFilterUse != 0) {
        if (_bedFilterUse & Bed.double.mask == Bed.double.mask) {
          rooms = rooms.where((element) => element.bed == Bed.double.index);
        }
        if (_bedFilterUse & Bed.twoBeds.mask == Bed.twoBeds.mask) {
          rooms = rooms.where((element) => element.bed == Bed.twoBeds.index);
        }
        if (_bedFilterUse & Bed.single.mask == Bed.single.mask) {
          rooms = rooms.where((element) => element.bed == Bed.single.index);
        }
        if (_bedFilterUse & Bed.threeBeds.mask == Bed.threeBeds.mask) {
          rooms = rooms.where((element) => element.bed == Bed.threeBeds.index);
        }
        if (_bedFilterUse & Bed.kingSize.mask == Bed.kingSize.mask) {
          rooms = rooms.where((element) => element.bed == Bed.kingSize.index);
        }
        if (_bedFilterUse & Bed.multipleBeds.mask == Bed.multipleBeds.mask) {
          rooms = rooms.where((element) => element.bed == Bed.multipleBeds.index);
        }
      }

      if (_floorFilterUse != 0) {
        if (_floorFilterUse & Floor.first.mask == Floor.first.mask) {
          rooms = rooms.where((element) => element.floor == Floor.first.index);
        }
        if (_floorFilterUse & Floor.second.mask == Floor.second.mask) {
          rooms = rooms.where((element) => element.floor == Floor.second.index);
        }
        if (_floorFilterUse & Floor.third.mask == Floor.third.mask) {
          rooms = rooms.where((element) => element.floor == Floor.third.index);
        }
        if (_floorFilterUse & Floor.fourth.mask == Floor.fourth.mask) {
          rooms = rooms.where((element) => element.floor == Floor.fourth.index);
        }
      }

      if (_statusFilterUse != 0 && !booking) {
        if (_statusFilterUse & Status.vacancies.mask == Status.vacancies.mask) {
          rooms = rooms.where((element) => element.status == Status.vacancies.index);
        }
        if (_statusFilterUse & Status.booked.mask == Status.booked.mask) {
          rooms = rooms.where((element) => element.status == Status.booked.index);
        }
        if (_statusFilterUse & Status.cleaning.mask == Status.cleaning.mask) {
          rooms = rooms.where((element) => element.status == Status.cleaning.index);
        }
        if (_statusFilterUse & Status.repair.mask == Status.repair.mask) {
          rooms = rooms.where((element) => element.status == Status.repair.index);
        }
      }
    }

    return rooms;
  }

  void setStatus(int key, int status) async {
    Room room = repo.get(key);
    room.status = status;
    room.save();
    notifyListeners();
  }

  int bookedRooms() {
    return repo.values.where((element) => (element as Room).status == Status.booked.index).length;
  }

  int vacantRooms() {
    return repo.values.where((element) => (element as Room).status == Status.vacancies.index).length;
  }

  int bookedPercent() {
    if (repo.isEmpty) {
      return 0;
    }
    return (bookedRooms() / repo.values.length * 100).round();
  }

  bool canBooked() {
    return repo.values.any((element) => (element as Room).status == Status.vacancies.index);
  }

  bool? _wifiFilter;
  bool? _toiletFilter;
  int _viewFilter = 0;
  int _bedFilter = 0;
  int _floorFilter = 0;
  int _statusFilter = 0;

  bool? _wifiFilterUse;
  bool? _toiletFilterUse;
  int _viewFilterUse = 0;
  int _bedFilterUse = 0;
  int _floorFilterUse = 0;
  int _statusFilterUse = 0;

  bool _useFilters = false;

  bool get useFilters => _useFilters;

  void setFileters() {
    _useFilters = true;
    _wifiFilterUse = _wifiFilter;
    _toiletFilterUse = _toiletFilter;
    _viewFilterUse = _viewFilter;
    _bedFilterUse = _bedFilter;
    _floorFilterUse = _floorFilter;
    _statusFilterUse = _statusFilter;
    notifyListeners();
  }

  bool? get wifiFilter => _wifiFilter;
  set wifiFilter(bool? value) {
    _wifiFilter = value;
    notifyListeners();
  }

  bool? get toiletFilter => _toiletFilter;
  set toiletFilter(bool? value) {
    _toiletFilter = value;
    notifyListeners();
  }

  int get viewFilter => _viewFilter;
  set viewFilter(int value) {
    _viewFilter = value;
    notifyListeners();
  }

  int get bedFilter => _bedFilter;
  set bedFilter(int value) {
    _bedFilter = value;
    notifyListeners();
  }

  int get floorFilter => _floorFilter;
  set floorFilter(int value) {
    _floorFilter = value;
    notifyListeners();
  }

  int get statusFilter => _statusFilter;
  set statusFilter(int value) {
    _statusFilter = value;
    notifyListeners();
  }

  bool haveFilter() {
    return _wifiFilter != null ||
        _toiletFilter != null ||
        _viewFilter != 0 ||
        _bedFilter != 0 ||
        _floorFilter != 0 ||
        _statusFilter != 0 ||
        _searchString.isNotEmpty;
  }

  void clearFilters() {
    _wifiFilter = null;
    _toiletFilter = null;
    _viewFilter = 0;
    _bedFilter = 0;
    _floorFilter = 0;
    _statusFilter = 0;
    _useFilters = false;
    _wifiFilterUse = null;
    _toiletFilterUse = null;
    _viewFilterUse = 0;
    _bedFilterUse = 0;
    _floorFilterUse = 0;
    _statusFilterUse = 0;
    _useFilters = false;
    notifyListeners();
  }
}
