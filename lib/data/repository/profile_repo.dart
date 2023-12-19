import 'package:learners_choice_app/core/models/profile_model.dart';
import 'package:sqflite/sqflite.dart';

class ProfileDataRepository {
  static const String dbPath = 'lib/data/mydatabase.db';

  static const int dbVersion = 1;

  Future<Database> openDb() async {
    return await openDatabase(
      dbPath,
      version: dbVersion,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE profiles (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            profileName TEXT NOT NULL,
            profilePic TEXT NOT NULL
          )
        ''');
      },
    );
  }

  Future<void> saveProfile(String profileName, String profilePic) async {
    final db = await openDb();
    final profile =
        Profile(1, profileName: profileName, profilePic: profilePic);
    // Insert the profile data into the 'profiles' table
    await db.insert('profiles', profile.toMap());
    // Close the database connection
    await db.close();
  }

  // Methods for CRUD operations on Profile data...}
}
