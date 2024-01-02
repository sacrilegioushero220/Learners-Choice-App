import 'package:flutter/services.dart';
import 'package:learners_choice_app/core/models/profile_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;

class ProfileDataRepository {
  static const String dbName = 'mydatabase.db';
  static const int dbVersion = 1;

  Future<Database> openDb() async {
    print("Open db is called in repo");

    io.Directory applicationDirectory =
        await getApplicationDocumentsDirectory();

    String dbPath = path.join(applicationDirectory.path, dbName);

    bool dbExists = await io.File(dbPath).exists();

    if (!dbExists) {
      // Copy from asset
      ByteData data = await rootBundle.load(path.join("assets/db", dbName));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await io.File(dbPath).writeAsBytes(bytes, flush: true);
    }
    return await openDatabase(
      dbPath,
      version: dbVersion,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE profiles (
            id INTEGER PRIMARY KEY,
            profileName TEXT NOT NULL,
            profilePic TEXT NOT NULL
          )
        ''');
      },
    );
  }

  Future<void> saveProfile(String profileName, String profilePic) async {
    try {
      print("saveProfile is called with : $profileName and $profilePic");
      final db = await openDb();

      // Check if a profile with the same ID already exists
      final profiles = await db.query(
        'profiles',
        where: 'profileName = ?',
        whereArgs: [profileName],
      );

      if (profiles.isNotEmpty) {
        // Profile with the same profileName already exists, update it
        final existingProfile = profiles.first;
        final updatedProfile = Profile(
          existingProfile['id'] as int,
          profileName: profileName,
          profilePic: profilePic,
        );

        await db.update(
          'profiles',
          updatedProfile.toMap(),
          where: 'id = ?',
          whereArgs: [existingProfile['id']],
        );
      } else {
        // Profile with the specified profileName doesn't exist, insert a new one
        final profile =
            Profile(null, profileName: profileName, profilePic: profilePic);
        await db.insert('profiles', profile.toMap());
      }

      // Close the database connection
      await db.close();
    } catch (e) {
      print('Error saving profile: $e');
      throw Exception('Error saving profile: $e');
    }
  }
}
