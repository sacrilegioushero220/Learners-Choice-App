import 'package:sqflite/sqflite.dart';

class ProfileDataRepository {
  static const String tableName = 'profileData';

  Future<void> createProfileData(Database db) async {
    await db.execute('''
      CREATE TABLE $tableName (
        id INTEGER PRIMARY KEY,
        profileName TEXT,
        profilePic TEXT
      );
    ''');
  }

  Future<void> insertProfileData(
      Database db, String profileName, String profilePic) async {
    await db.insert(
      tableName,
      {'profileName': profileName, 'profilePic': profilePic},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
