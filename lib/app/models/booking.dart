import 'package:hive/hive.dart';

part 'booking.g.dart';

@HiveType(typeId: 4)
class Booking extends HiveObject {
  @HiveField(0)
  HiveList? room;

  @HiveField(1)
  DateTime? arrival;

  @HiveField(2)
  DateTime? departure;

  @HiveField(3)
  String comment;

  @HiveField(4)
  String name;

  @HiveField(5)
  String phone;

  @HiveField(6)
  String email;

  @HiveField(7)
  bool? earlyCheckin;

  @HiveField(8)
  bool? breakfast;

  @HiveField(9)
  int sum;

  bool isNotEmpty() {
    return room != null && arrival != null && departure != null && name.isNotEmpty && phone.isNotEmpty && email.isNotEmpty;
  }

  void copyWith(Booking booking) {
    room = booking.room;
    arrival = booking.arrival;
    departure = booking.departure;
    comment = booking.comment;
    name = booking.name;
    phone = booking.phone;
    email = booking.email;
    earlyCheckin = booking.earlyCheckin;
    breakfast = booking.breakfast;
    sum = booking.sum;
  }

  Booking({
    required this.comment,
    required this.name,
    required this.phone,
    required this.email,
    required this.sum,
    this.room,
    this.arrival,
    this.departure,
    this.earlyCheckin,
    this.breakfast,
  });
}
