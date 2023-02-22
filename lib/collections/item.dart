import 'package:isar/isar.dart';
import 'package:lend_buddy/collections/user.dart';

part 'item.g.dart';

@collection
class Item { 
  //attributes
  Id id = Isar.autoIncrement;

  IsarLink<User> user = IsarLink<User>();

  String libelle = "";
}
