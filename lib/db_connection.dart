// db_connection.dart

import 'package:mysql1/mysql1.dart';

class DatabaseConnection {
  static Future<MySqlConnection> getConnection() async {
    // Configurar la conexión
    final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306, // generalmente es 3306
      user: 'root',
      password: '',
      db: 'libroteca',
    ));

    return conn;
  }
}
