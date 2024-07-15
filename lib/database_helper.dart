// database_helper.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'libro.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'libroteca.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE libros(id INTEGER PRIMARY KEY, codigo TEXT, titulo TEXT, autor TEXT, fecha TEXT, isbn TEXT, numeroPaginas INTEGER, editorial TEXT, genero TEXT, sinopsis TEXT)',
        );
      },
    );
  }

  Future<void> insertLibro(Libro libro) async {
    final db = await database;
    await db.insert('libros', libro.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Libro>> libros() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('libros');
    return List.generate(maps.length, (i) {
      return Libro(
        id: maps[i]['id'],
        codigo: maps[i]['codigo'],
        titulo: maps[i]['titulo'],
        autor: maps[i]['autor'],
        fecha: maps[i]['fecha'],
        isbn: maps[i]['isbn'],
        numeroPaginas: maps[i]['numeroPaginas'],
        editorial: maps[i]['editorial'],
        genero: maps[i]['genero'],
        sinopsis: maps[i]['sinopsis'],
      );
    });
  }

  Future<void> deleteLibro(int id) async {
    final db = await database;
    await db.delete('libros', where: 'id = ?', whereArgs: [id]);
  }
}
