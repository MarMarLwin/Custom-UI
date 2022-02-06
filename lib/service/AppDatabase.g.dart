// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppDatabase.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MovieDao? _movieDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Movie` (`adult` TEXT NOT NULL, `backdropPath` TEXT NOT NULL, `id` INTEGER NOT NULL, `originalLanguage` TEXT NOT NULL, `originalTitle` TEXT NOT NULL, `overview` TEXT NOT NULL, `popularity` TEXT NOT NULL, `posterPath` TEXT NOT NULL, `releaseDate` TEXT NOT NULL, `title` TEXT NOT NULL, `video` TEXT NOT NULL, `voteAverage` TEXT NOT NULL, `voteCount` INTEGER NOT NULL, `isFav` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MovieDao get movieDao {
    return _movieDaoInstance ??= _$MovieDao(database, changeListener);
  }
}

class _$MovieDao extends MovieDao {
  _$MovieDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _movieInsertionAdapter = InsertionAdapter(
            database,
            'Movie',
            (Movie item) => <String, Object?>{
                  'adult': item.adult,
                  'backdropPath': item.backdropPath,
                  'id': item.id,
                  'originalLanguage': item.originalLanguage,
                  'originalTitle': item.originalTitle,
                  'overview': item.overview,
                  'popularity': item.popularity,
                  'posterPath': item.posterPath,
                  'releaseDate': item.releaseDate,
                  'title': item.title,
                  'video': item.video,
                  'voteAverage': item.voteAverage,
                  'voteCount': item.voteCount,
                  'isFav': item.isFav
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Movie> _movieInsertionAdapter;

  @override
  Future<List<Movie>> getPopularMovies(String current) async {
    return _queryAdapter.queryList(
        'SELECT * FROM MOVIE WHERE Date(releaseDate)<Date(?1)',
        mapper: (Map<String, Object?> row) => Movie(
            id: row['id'] as int,
            adult: row['adult'] as String,
            backdropPath: row['backdropPath'] as String,
            originalLanguage: row['originalLanguage'] as String,
            originalTitle: row['originalTitle'] as String,
            overview: row['overview'] as String,
            popularity: row['popularity'] as String,
            posterPath: row['posterPath'] as String,
            releaseDate: row['releaseDate'] as String,
            title: row['title'] as String,
            video: row['video'] as String,
            voteAverage: row['voteAverage'] as String,
            voteCount: row['voteCount'] as int,
            isFav: row['isFav'] as int),
        arguments: [current]);
  }

  @override
  Future<List<Movie>> getUpcomingMovies(String current) async {
    return _queryAdapter.queryList(
        'SELECT * FROM MOVIE WHERE Date(releaseDate)>Date(?1)',
        mapper: (Map<String, Object?> row) => Movie(
            id: row['id'] as int,
            adult: row['adult'] as String,
            backdropPath: row['backdropPath'] as String,
            originalLanguage: row['originalLanguage'] as String,
            originalTitle: row['originalTitle'] as String,
            overview: row['overview'] as String,
            popularity: row['popularity'] as String,
            posterPath: row['posterPath'] as String,
            releaseDate: row['releaseDate'] as String,
            title: row['title'] as String,
            video: row['video'] as String,
            voteAverage: row['voteAverage'] as String,
            voteCount: row['voteCount'] as int,
            isFav: row['isFav'] as int),
        arguments: [current]);
  }

  @override
  Future<Movie?> getMovieById(String id) async {
    return _queryAdapter.query('SELECT * FROM MOVIE WHERE id=?1',
        mapper: (Map<String, Object?> row) => Movie(
            id: row['id'] as int,
            adult: row['adult'] as String,
            backdropPath: row['backdropPath'] as String,
            originalLanguage: row['originalLanguage'] as String,
            originalTitle: row['originalTitle'] as String,
            overview: row['overview'] as String,
            popularity: row['popularity'] as String,
            posterPath: row['posterPath'] as String,
            releaseDate: row['releaseDate'] as String,
            title: row['title'] as String,
            video: row['video'] as String,
            voteAverage: row['voteAverage'] as String,
            voteCount: row['voteCount'] as int,
            isFav: row['isFav'] as int),
        arguments: [id]);
  }

  @override
  Future<void> insertData(Movie data) async {
    await _movieInsertionAdapter.insert(data, OnConflictStrategy.replace);
  }

  @override
  Future<void> insertAllData(List<Movie> data) async {
    await _movieInsertionAdapter.insertList(data, OnConflictStrategy.replace);
  }
}
