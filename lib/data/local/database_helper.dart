import 'package:falcons_task/domain/model/items_response_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'inventory.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE items (
            itemNo TEXT PRIMARY KEY,
            name TEXT,
            barcode TEXT,
            qty TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertItems(List<ItemsResponseModel> items) async {
    final db = await database;
    for (var item in items) {
      await db.insert(
        'items',
        {
          'itemNo': item.itemNo,
          'name': item.name,
          'barcode': item.barcode,
          'qty': item.qty,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<ItemsResponseModel>> fetchItems() async {
    final db = await database;
    final result = await db.query('items');

    return result.map((row) {
      return ItemsResponseModel(
        itemNo: (row['itemNo'] as String?) ?? "",
        name: (row['name'] as String?) ?? "",
        barcode: (row['barcode'] as String?) ?? "",
        qty: (row['qty'] as String?) ?? "0",
      );
    }).toList();
  }
}
