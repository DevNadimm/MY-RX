import 'package:new_app/features/medication/models/medication_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Future<Database> initDB () async {
    String getDatabasePath = await getDatabasesPath();
    String path = join(getDatabasePath, 'medication.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  static _onCreate (Database db, int version) async {
    String sql = '''CREATE TABLE tbl_medication (id INTEGER PRIMARY KEY, name TEXT, type TEXT, startDate TEXT, endDate TEXT, time TEXT, whenToTake TEXT)''';
    await db.execute(sql);
  }

  static Future<int> createMedication (MedicationModel medication) async {
    Database db = await initDB();
    return await db.insert('tbl_medication', medication.toMap());
  }

  static Future<List<MedicationModel>> readMedication () async {
    Database db = await initDB();
    var medication = await db.query('tbl_medication');
    List<MedicationModel> medicationList = medication.isNotEmpty
        ? medication.map((e) => MedicationModel.fromMap(e)).toList()
        : [];
    return medicationList;
  }

  static Future<int> updateMedication(MedicationModel medication) async {
    Database db = await initDB();
    return db.update(
      'tbl_medication',
      medication.toMap(),
      where: 'id =?',
      whereArgs: [medication.id],
    );
  }

  static Future<int> deleteMedication(int id) async {
    Database db = await initDB();
    return db.delete(
      'tbl_medication',
      where: 'id =?',
      whereArgs: [id],
    );
  }
}
