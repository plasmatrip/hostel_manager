// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookingAdapter extends TypeAdapter<Booking> {
  @override
  final int typeId = 4;

  @override
  Booking read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Booking(
      comment: fields[3] as String,
      name: fields[4] as String,
      phone: fields[5] as String,
      email: fields[6] as String,
      sum: fields[9] as int,
      room: (fields[0] as HiveList?)?.castHiveList(),
      arrival: fields[1] as DateTime?,
      departure: fields[2] as DateTime?,
      earlyCheckin: fields[7] as bool?,
      breakfast: fields[8] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Booking obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.room)
      ..writeByte(1)
      ..write(obj.arrival)
      ..writeByte(2)
      ..write(obj.departure)
      ..writeByte(3)
      ..write(obj.comment)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.phone)
      ..writeByte(6)
      ..write(obj.email)
      ..writeByte(7)
      ..write(obj.earlyCheckin)
      ..writeByte(8)
      ..write(obj.breakfast)
      ..writeByte(9)
      ..write(obj.sum);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
