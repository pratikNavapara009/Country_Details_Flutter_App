import 'dart:typed_data';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();

  final String countryTable = "country";
  final String fieldId = "ID";
  final String fieldName = "name";
  final String fieldCountry = "country";
  final String fieldCapital = "Capital";
  final String fieldTime = "Time";
  final String fieldArea = "Area";
  final String fieldBorder = "population";
  final String fieldRegin = "Regin";
  final String fieldSubRegin = "subregion";
  final String fieldLng = "languages";
  final String fieldImage = "IMAGE";

  late Database database;

  Future<void> createDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, "demo.db");

    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      String query =
          "CREATE TABLE IF NOT EXISTS $countryTable ($fieldId INTEGER PRIMARY KEY AUTOINCREMENT,$fieldName TEXT, $fieldCountry TEXT, $fieldBorder TEXT, $fieldLng TEXT, $fieldImage BLOB, $fieldArea TEXT, $fieldSubRegin TEXT, $fieldRegin TEXT, $fieldTime TEXT);";
      await db.execute(query);
    });
  }

  Future<int> insertData(
      {required String name,
      required String country,
      required String border,
      required int lng,
      required String subRegion,
      required String region,
      required String area,
      required String languages,
      required String time,
      required String population,
      required Uint8List? image}) async {
    await createDB();

    String query =
        "INSERT INTO $countryTable ($fieldName,$fieldArea,$fieldBorder,$fieldLng,$fieldImage,$fieldTime,$fieldRegin,$fieldSubRegin,$fieldCapital,$fieldCountry) VALUES (?, ?, ?, ?, ?, ?,?,?,?,?);";
    List argy = [
      name,
      country,
      border,
      lng,
      image,
      time,
      region,
      subRegion,
      area,
      languages
    ];
    int id = await database.rawInsert(query, argy);
    return id;
  }

  Future fetchAllData() async {
    await createDB();
    String query = "SELECT * FROM $countryTable;";
    List<Map<String, dynamic>> allData = await database.rawQuery(query);
    return allData;
  }
}
