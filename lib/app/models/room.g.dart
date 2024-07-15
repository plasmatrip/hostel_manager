// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RoomAdapter extends TypeAdapter<Room> {
  @override
  final int typeId = 1;

  @override
  Room read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Room(
      images: (fields[0] as List).cast<String>(),
      name: fields[1] as String,
      price: fields[2] as int,
      description: fields[3] as String,
      status: fields[4] as int?,
      floor: fields[5] as int?,
      bed: fields[6] as int?,
      view: fields[7] as int?,
      wifi: fields[8] as bool?,
      toilet: fields[9] as bool?,
      bathAccessories: fields[10] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Room obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.images)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.floor)
      ..writeByte(6)
      ..write(obj.bed)
      ..writeByte(7)
      ..write(obj.view)
      ..writeByte(8)
      ..write(obj.wifi)
      ..writeByte(9)
      ..write(obj.toilet)
      ..writeByte(10)
      ..write(obj.bathAccessories);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoomAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
