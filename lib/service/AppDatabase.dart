import 'package:codigo/dao/movieDao.dart';
import 'package:codigo/model/movieModel.dart';
// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'AppDatabase.g.dart'; // the generated code will be there

@Database(version: 1, entities: [
  Movie,
])
abstract class AppDatabase extends FloorDatabase {
  MovieDao get movieDao;
}
