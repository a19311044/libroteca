import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'libro.dart'; // Importa el modelo de libro que definiste

class DatabaseHelper {
  static Database? _database;
  static const String dbName = 'libroteca.db';

  Future<Database> get database async {
    if (_database != null) return _database!;

    // Si _database es null, inicializarlo
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), dbName);
    return await openDatabase(path, version: 1, onCreate: _createTables);
  }

  Future<void> _createTables(Database db, int version) async {
    // Crear las tablas
    await db.execute('''
      CREATE TABLE usuarios (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL,
        apellidos TEXT NOT NULL,
        usuario TEXT NOT NULL UNIQUE,
        email TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE libros (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        titulo TEXT NOT NULL,
        autor TEXT NOT NULL,
        fecha TEXT,
        paginas INTEGER,
        isbn TEXT UNIQUE,
        editorial TEXT,
        genero TEXT,
        sinopsis TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE libreria (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        libro_id INTEGER NOT NULL,
        usuario_id INTEGER NOT NULL,
        estatus TEXT NOT NULL DEFAULT 'porleer',
        FOREIGN KEY (libro_id) REFERENCES libros(id),
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
      )
    ''');
  }
    Future<int> insertLibro(Libro libro) async {
    final db = await database;
    return await db.insert('libros', libro.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
