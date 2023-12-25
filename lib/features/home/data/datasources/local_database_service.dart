import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:whatsapp_manager/features/home/data/models/database_model.dart';
import 'package:whatsapp_manager/features/home/data/models/message_model.dart';

class WpManagerDB {
  static final WpManagerDB instance = WpManagerDB._init();

  static Database? _database;
  WpManagerDB._init() {}

  Future<Database> get database async {
    print('creating new database...');
    if (_database != null) {
      return _database!;
    }
    _database = await _initDB("wpmanager.db");
    return _database!;
  }

  Future<Database> _initDB(String filepath) async {
    final path = join(await getDatabasesPath(), filepath);

    return openDatabase(
      path,
      singleInstance: true,
      version: 1,
      onCreate: _createDb,
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  FutureOr<void> _createDb(Database db, int version) {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const timestampType = 'TIMESTAMP DEFAULT CURRENT_TIMESTAMP';
    print('creating new database...');

    db.execute(''' 
    create table if not exists ${MessageTableModel.tableName} (
        ${MessageTableModel.id} $idType ,
        ${MessageTableModel.contactName} $textType ,
        ${MessageTableModel.contactMessage} $textType ,
        ${MessageTableModel.contactNumber} $textType ,
        ${MessageTableModel.status} $textType ,
        ${MessageTableModel.time} $textType ,
        ${MessageTableModel.createdAt} $timestampType
    )
      ''');
  }

  FutureOr<MessaageModel> insertMessage(MessaageModel message) async {
    final db = await instance.database;
    final id = await db.insert(MessageTableModel.tableName, message.toMap());
    return message.copyWith(id: id);
  }

  Future<MessaageModel?> readMessageFromId(int id) async {
    final db = await instance.database;
    final map = await db.query(
      MessageTableModel.tableName,
      columns: MessageTableModel.values,
      where: '${MessageTableModel.id} = ?',
      whereArgs: [id],
    );

    if (map.isNotEmpty) {
      return MessaageModel.fromMap(map.first);
    }

    return null;
  }
}
