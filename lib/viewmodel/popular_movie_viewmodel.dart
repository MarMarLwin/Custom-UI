import 'dart:convert';

import 'package:codigo/constant.dart';
import 'package:codigo/model/movie_response.dart';
import 'package:codigo/model/movieModel.dart';
import 'package:codigo/service/AppDatabase.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class PopularMovieViewModel extends GetxController {
  final List<PopularMovie> _popularMovies = [];
  final List<Movie> _movies = [];
  late final Movie movieData;

  List<PopularMovie> get popularMovie => _popularMovies;
  List<Movie> get movies => _movies;
  late bool _isLoading = false;

  bool get isLoading => _isLoading;
  @override
  void onInit() {
    super.onInit();
    _isLoading = true;
    _getPopularLocalMovies();
    _getPopularMovies();
  }

  _getPopularLocalMovies() async {
    _isLoading = true;
    var database =
        await $FloorAppDatabase.databaseBuilder('codigo_database.db').build();
    database.movieDao
        .getPopularMovies(DateFormat('yyyy-MM-dd').format(DateTime.now()))
        .then((value) => _movies.addAll(value));
    _isLoading = false;
    update();
  }

  _getPopularMovies() async {
    try {
      _isLoading = true;
      var database =
          await $FloorAppDatabase.databaseBuilder('codigo_database.db').build();
      var popularApiLink =
          'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey';
      var response = await http.get(
        Uri.parse(popularApiLink),
      );

      var parsedData = jsonDecode(response.body);
      var popularList = PopularMovie.fromJson(parsedData);

      _popularMovies.add(popularList);
      var movies =
          (parsedData["results"] as List).map((i) => Movie.fromJson(i));
      if (_movies.isEmpty) _movies.addAll(movies);

      database.movieDao.insertAllData(_movies);
      _isLoading = false;
      update();
    } catch (e) {
      print(e.toString());
    }
  }

  updateMovie(Movie movieData) async {
    var database =
        await $FloorAppDatabase.databaseBuilder('codigo_database.db').build();
    database.movieDao.insertData(movieData);
    update();
  }
}
