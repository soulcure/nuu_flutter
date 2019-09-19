import 'dart:async';

import 'package:konnect/model/device.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String tableName = 'devices';

  final String deviceSN = 'deviceSN';
  final String deviceId = 'deviceId';

  static Database _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'konnect.db');

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tableName($deviceSN TEXT PRIMARY KEY, $deviceId TEXT)');
  }

  Future<int> saveDevice(Device device) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableName, device.toMap());

    return result;
  }

  Future<List> getAllDevices({int limit, int offset}) async {
    var dbClient = await db;
    var result = await dbClient.query(
      tableName,
      columns: [deviceSN, deviceId],
      limit: limit,
      offset: offset,
    );

    return result.toList();
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableName'));
  }

  Future<Device> getDevice(int sn) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableName,
        columns: [deviceSN, deviceId], where: '$deviceSN = ?', whereArgs: [sn]);

    if (result.length > 0) {
      return Device.fromMap(result.first);
    }

    return null;
  }

  Future<int> deleteDevice(String sn) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableName, where: '$deviceSN = ?', whereArgs: [sn]);
  }

  Future<int> updateDevice(Device device) async {
    var dbClient = await db;
    return await dbClient.update(tableName, device.toMap(),
        where: "$deviceSN = ?", whereArgs: [device.deviceSN]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
