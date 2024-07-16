import 'package:hive/hive.dart';

part 'room.g.dart';

@HiveType(typeId: 1)
class Room extends HiveObject {
  @HiveField(0)
  String image1;

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

  @HiveField(11)
  String image2;

  @HiveField(12)
  String image3;

  @HiveField(13)
  String image4;

  @HiveField(14)
  String image5;

  bool isNotEmpty() {
    return image1.isNotEmpty &&
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
    image1 = room.image1;
    image2 = room.image2;
    image3 = room.image3;
    image4 = room.image4;
    image5 = room.image5;
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
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
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
