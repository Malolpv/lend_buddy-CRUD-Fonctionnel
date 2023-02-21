import 'package:isar/isar.dart';
import 'package:lend_buddy/collections/item.dart';
import 'package:lend_buddy/collections/lend.dart';
import 'package:lend_buddy/collections/user.dart';

//CODED BY MALO

class IsarHelper {
  late Future<Isar> db;

  IsarHelper() {
    db = openDb();
  }

  Future<Isar> openDb() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([
        UserSchema,
        ItemSchema,
        LendSchema,
      ], inspector: true);
    }
    return Future.value(Isar.getInstance());
  }

  Future<int> saveUser(User user) async {
    final isar = await db;
    return isar.writeTxnSync<int>(() => isar.users.putSync(user));
  }

  Future<void> saveItem(Item item) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.items.putSync(item));
  }

  Future<void> saveLend(Lend lend) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.lends.putSync(lend));
  }

  //Get all items by user
  Future<List<Item>> getAllItems(int userId) async {
    final isar = await db;
    return isar.items
        .where()
        .filter()
        .user((u) => u.idEqualTo(userId))
        .findAll();
  }

  //Get all lend active by user
  Future<List<Lend>> getAllActiveLend(int userId) async {
    final isar = await db;
    return isar.lends
        .where()
        .filter()
        .user((u) => u.idEqualTo(userId))
        .and()
        .isReturnedEqualTo(false)
        .findAll();
  }

  //Get the User with given Email
  Future<User?> getUserByEmail(String email) async {
    final isar = await db;
    return isar.users.filter().mailEqualTo(email).findFirst();
  }

  Future<User?> login(String email, String pass) async {
    final isar = await db;
    return isar.users
        .filter()
        .mailEqualTo(email)
        .and()
        .passEqualTo(pass)
        .findFirstSync();
  }

  Future<User?> getUserById(int idUser) async {
    final isar = await db;
    return isar.users.filter().idEqualTo(idUser).findFirst();
  }

  Future<bool> deleteLend(int id) async {
    final isar = await db;
    return isar.writeTxn(() => isar.lends.delete(id));
  }
}
