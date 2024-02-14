import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SettingDB {
  static Future<void> createTable(Database database) async {
    await database.execute('''
            CREATE TABLE SaveSetting (
            id INTEGER PRIMARY KEY,
            adjustSize DOUBLE,
            isIncludeSpace INTEGER
            )
            ''');
  }

  static Future<Database> CreateSettingDB() async {
    if (Platform.isWindows || Platform.isLinux) {
      sqfliteFfiInit();
      final databaseFactory = databaseFactoryFfi;
      return databaseFactory.openDatabase("setting.db",
          options: OpenDatabaseOptions(
              version: 1,
              onCreate: (Database database, int version) async {
                await createTable(database);
              }));
    } else if (Platform.isAndroid || Platform.isIOS) {
      return openDatabase("setting.db", version: 1,
          onCreate: (Database database, int version) async {
        await createTable(database);
      });
    }
    throw Exception("Unsupported platform");
  }

  static Future<int> insertSaveSetting(SaveSetting saveSetting) async {
    final db = await SettingDB.CreateSettingDB();

    final id = await db.insert(
      'SaveSetting',
      saveSetting.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

  static Future<List<SaveSetting>> getSaveSetting() async {
    final db = await SettingDB.CreateSettingDB();
    final List<Map<String, dynamic>> data = await db.query('SaveSetting');

    return List.generate(
        data.length,
        (index) => SaveSetting(
              id: data[index]['id'],
              adjustSize: data[index]['adjustSize'],
              isIncludeSpace:
                  (data[index]['isIncludeSpace'] == 0 ? false : true),
            ));
  }

  static Future<int> updateSaveSetting(SaveSetting saveSetting) async {
    final db = await SettingDB.CreateSettingDB();

    final result = await db.update(
      'SaveSetting',
      saveSetting.toMap(),
      where: "id = ?",
      whereArgs: [saveSetting.id],
    );
    return result;
  }

  static Future<void> deleteSaveSetting(int id) async {
    final db = await SettingDB.CreateSettingDB();

    try {
      await db.delete(
        'SaveSetting',
        where: "id = ?",
        whereArgs: [id],
      );
    } catch (err) {
      debugPrint("$err");
    }
  }
}

class SaveSetting {
  int id;
  double adjustSize;
  bool isIncludeSpace;

  late int isIncludeSpaceInt;

  SaveSetting(
      {required this.id,
      required this.adjustSize,
      required this.isIncludeSpace}) {
    if (isIncludeSpace == false) {
      isIncludeSpaceInt = 0;
    } else {
      isIncludeSpaceInt = 1;
    }
  }

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      "id": id,
      "adjustSize": adjustSize,
      "isIncludeSpace": isIncludeSpaceInt,
    };
    return map;
  }
}
