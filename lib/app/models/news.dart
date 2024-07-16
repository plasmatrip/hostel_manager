import 'package:hive/hive.dart';

part 'news.g.dart';

@HiveType(typeId: 3)
class News extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String image;

  @HiveField(2)
  String icon;

  @HiveField(3)
  List<String> content;

  @HiveField(4)
  String subTitle;

  @HiveField(5)
  String time;

  News({
    required this.title,
    required this.image,
    required this.icon,
    required this.content,
    required this.subTitle,
    required this.time,
  });
}
