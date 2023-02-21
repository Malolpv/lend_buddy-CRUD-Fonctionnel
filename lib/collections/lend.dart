import 'package:isar/isar.dart';
import 'package:lend_buddy/collections/item.dart';
import 'package:lend_buddy/collections/user.dart';

part 'lend.g.dart';

@collection
class Lend {
  //attributes
  Id id = Isar.autoIncrement;

  final item = IsarLink<Item>();
  final user = IsarLink<User>();

  String? contact;

  bool isReturned = false;
  DateTime? startDate, endDate;

  void returned() => isReturned = true;
}
