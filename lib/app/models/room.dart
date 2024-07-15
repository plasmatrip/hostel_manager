import 'package:hive/hive.dart';

part 'room.g.dart';

@HiveType(typeId: 1)
class Room extends HiveObject {
  @HiveField(0)
  List<String> images;

  @HiveField(1)
  String name;

  @HiveField(2)
  int price;

  @HiveField(3)
  String description;

  @HiveField(4)
  int? status;

  @HiveField(5)
  int? floor;

  @HiveField(6)
  int? bed;

  @HiveField(7)
  int? view;

  @HiveField(8)
  bool? wifi;

  @HiveField(9)
  bool? toilet;

  @HiveField(10)
  bool? bathAccessories;

  bool isNotEmpty() {
    return images.isNotEmpty &&
        name.isNotEmpty &&
        price != 0 &&
        description.isNotEmpty &&
        status != null &&
        floor != null &&
        bed != null &&
        view != null &&
        wifi != null &&
        toilet != null &&
        bathAccessories != null;
  }

  void copyWith(Room room) {
    images = room.images;
    name = room.name;
    price = room.price;
    description = room.description;
    status = room.status;
    floor = room.floor;
    bed = room.bed;
    view = room.view;
    wifi = room.wifi;
    toilet = room.toilet;
    bathAccessories = room.bathAccessories;
  }

  Room({
    required this.images,
    required this.name,
    required this.price,
    required this.description,
    this.status,
    this.floor,
    this.bed,
    this.view,
    this.wifi,
    this.toilet,
    this.bathAccessories,
  });
}
