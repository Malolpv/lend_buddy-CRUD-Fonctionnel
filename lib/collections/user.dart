import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement;
  String? name, surname, pass;

  @Index(unique: true)
  String? mail;
  //User(this.id, this.mail, this.pass, this.surname, this.name);
}
