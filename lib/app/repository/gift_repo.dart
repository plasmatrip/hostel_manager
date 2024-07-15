import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

enum Section { donated, received }

class GiftRepo with ChangeNotifier {
  // Box repo = Hive.box<Gift>(Boxes.gift);

  // Gift _gift = Gift(photo: '', name: '', price: 0, comment: '', rate: 0);

  // DateTime _selectedMonth = DateTime.now();

  // bool editMode = false;
  // int editKey = 0;

  // int _selectedSection = Section.donated.index;

  // int get selectedSection => _selectedSection;
  // set selectedSection(int value) {
  //   _selectedSection = value;
  //   notifyListeners();
  // }

  // String _searchString = '';

  // String get searchString => _searchString;
  // set searchString(String value) {
  //   _searchString = value;
  //   notifyListeners();
  // }

  // int get selectedMonth => _selectedMonth.month;
  // set selectedMonth(int value) {
  //   _selectedMonth = DateTime(_selectedMonth.year, value, 1);
  //   notifyListeners();
  // }

  // String get name => _gift.name;
  // set name(String value) {
  //   _gift.name = value;
  //   notifyListeners();
  // }

  // String get photo => _gift.photo;
  // set photo(String value) {
  //   _gift.photo = value;
  //   notifyListeners();
  // }

  // String get comment => _gift.comment;
  // set comment(String value) {
  //   _gift.comment = value;
  //   notifyListeners();
  // }

  // int get price => _gift.price;
  // set price(int value) {
  //   _gift.price = value;
  //   notifyListeners();
  // }

  // int? get section => _gift.section;
  // set section(int? value) {
  //   _gift.section = value;
  //   notifyListeners();
  // }

  // void setSection(int value) {
  //   _gift.section = value;
  // }

  // int get rate => _gift.rate;
  // set rate(int value) {
  //   _gift.rate = value;
  //   notifyListeners();
  // }

  // Holiday? getHoliday() {
  //   if (_gift.holiday == null) {
  //     return null;
  //   }
  //   return _gift.holiday!.first as Holiday;
  // }

  // void addHoliday(Holiday holiday) {
  //   _gift.holiday ??= HiveList(Hive.box<Holiday>(Boxes.holiday));
  //   if (_gift.holiday!.isNotEmpty) {
  //     _gift.holiday!.clear();
  //   }
  //   _gift.holiday!.add(holiday);
  //   notifyListeners();
  // }

  // People? getPeople() {
  //   if (_gift.people == null) {
  //     return null;
  //   }
  //   return _gift.people!.first as People;
  // }

  // void addPeople(People people) {
  //   _gift.people ??= HiveList(Hive.box<People>(Boxes.people));
  //   if (_gift.people!.isNotEmpty) {
  //     _gift.people!.clear();
  //   }
  //   _gift.people!.add(people);
  //   notifyListeners();
  // }

  // void clear() {
  //   _gift = Gift(photo: '', name: '', price: 0, comment: '', rate: 0);
  //   editMode = false;
  // }

  // Future<void> save() async {
  //   if (editMode) {
  //     Gift gift = repo.get(editKey);
  //     gift.copyWith(_gift);
  //     gift.save();
  //   } else {
  //     repo.add(_gift);
  //   }
  //   clear();
  //   notifyListeners();
  // }

  // Future<void> delete(int key) async {
  //   Gift gift = repo.get(key);
  //   gift.delete();
  //   notifyListeners();
  // }

  // void edit(int key) {
  //   _gift.copyWith(repo.get(key));
  //   editMode = true;
  //   editKey = key;
  // }

  // bool canSave() {
  //   return _gift.isNotEmpty();
  // }

  // Iterable getGifts({int? section, String? searchString}) {
  //   section ??= _selectedSection;
  //   searchString ??= _searchString;
  //   return repo.values.where((element) => (element as Gift).section == section && (searchString!.isEmpty ? true : element.name.contains(searchString)));
  // }
}
