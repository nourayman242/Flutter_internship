import 'package:hive/hive.dart';
part 'pantry_item.g.dart';

@HiveType(typeId: 0)
class PantryItem extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  int quantity;

  @HiveField(2)
  String category;

  PantryItem({
    required this.name,
    required this.quantity,
    required this.category,
  });
}
