import 'package:new_app/features/medication/models/medication_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/foundation.dart';

class DBHelper {
  static Future<Database> initDB() async {
    String getDatabasePath = await getDatabasesPath();
    String path = join(getDatabasePath, 'medication.db');
    debugPrint('📁 Database path: $path');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  static _onCreate(Database db, int version) async {
    String sql = '''
      CREATE TABLE tbl_medication (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        name TEXT, 
        type TEXT, 
        startDate TEXT, 
        endDate TEXT, 
        time TEXT, 
        whenToTake TEXT
      )
    ''';
    await db.execute(sql);
    debugPrint('✅ Database created with table tbl_medication');
  }

  static Future<int> createMedication(MedicationModel medication) async {
    Database db = await initDB();
    int id = await db.insert('tbl_medication', medication.toMap());
    debugPrint('➕ Inserted medication with id: $id');
    return id;
  }

  static Future<List<MedicationModel>> readMedication() async {
    Database db = await initDB();
    var medication = await db.query('tbl_medication');
    debugPrint('📖 Read ${medication.length} medications from database');
    List<MedicationModel> medicationList = medication.isNotEmpty
        ? medication.map((e) => MedicationModel.fromMap(e)).toList()
        : [];
    return medicationList;
  }

  static Future<int> updateMedication(MedicationModel medication) async {
    Database db = await initDB();
    int count = await db.update(
      'tbl_medication',
      medication.toMap(),
      where: 'id = ?',
      whereArgs: [medication.id],
    );
    debugPrint('🛠️ Updated medication with id: ${medication.id}, affected rows: $count');
    return count;
  }

  static Future<int> deleteMedication(int id) async {
    Database db = await initDB();
    int count = await db.delete(
      'tbl_medication',
      where: 'id = ?',
      whereArgs: [id],
    );
    debugPrint('🗑️ Deleted medication with id: $id, affected rows: $count');
    return count;
  }
}
