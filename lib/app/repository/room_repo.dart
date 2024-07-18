import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hostel_manager/app/internal/boxes.dart';
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

enum Floor { first, second, third, fourth }

enum Bed { double, threeBeds, single, twoBeds, kingSize, multipleBeds }

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

const mask1 = 0x1;
const mask2 = 0x2;
const mask3 = 0x4;
const mask4 = 0x8;

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
    return repo.values.where((element) => (element as Room).status == Status.vacancies.index);
  }

  Iterable rooms() {
    return repo.values.where((element) => _searchString.isEmpty ? true : (element as Room).name.contains(_searchString));
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
    return (bookedRooms() ~/ repo.values.length) * 100;
  }

  bool canBooked() {
    return repo.values.any((element) => (element as Room).status == Status.vacancies.index);
  }

  //
  //Filters
  //

  bool? _wifiFilter;
  bool? _toiletFilter;
  int _viewFilter = 0;
  int? _bedFilter;
  int? _floorFilter;
  int? _statusFilter;

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

  int? get bedFilter => _bedFilter;
  set bedFilter(int? value) {
    _bedFilter = value;
    notifyListeners();
  }

  int? get floorFilter => _floorFilter;
  set floorFilter(int? value) {
    _floorFilter = value;
    notifyListeners();
  }

  int? get statusFilter => _statusFilter;
  set statusFilter(int? value) {
    _statusFilter = value;
    notifyListeners();
  }

  bool haveFilter() {
    return _wifiFilter != null || _toiletFilter != null || _viewFilter != null || _bedFilter != null || _floorFilter != null || _statusFilter != null;
  }
}
