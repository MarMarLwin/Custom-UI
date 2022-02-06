import 'package:path/path.dart';

import 'AppDatabase.dart';

class LocalStorageMovie {
  LocalStorageMovie._();

  static final LocalStorageMovie db = LocalStorageMovie._();

  static AppDatabase? _database;

  Future<AppDatabase> get database async {
    if (_database != null) return _database!;
    _database = await initDb();
    return _database!;
  }

  Future<AppDatabase> initDb() async {
    var database =
        await $FloorAppDatabase.databaseBuilder('codigo_database.db').build();

    return database;
  }
}
