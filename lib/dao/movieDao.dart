import 'package:codigo/model/movieModel.dart';
import 'package:floor/floor.dart';

@dao
abstract class MovieDao {
  @Query('SELECT * FROM MOVIE WHERE Date(releaseDate)<Date(:current)')
  Future<List<Movie>> getPopularMovies(String current);

  @Query('SELECT * FROM MOVIE WHERE Date(releaseDate)>Date(:current)')
  Future<List<Movie>> getUpcomingMovies(String current);

  @Query('SELECT * FROM MOVIE WHERE id=:id')
  Future<Movie?> getMovieById(String id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertData(Movie data);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAllData(List<Movie> data);
}
