import 'package:codigo/viewmodel/movie_detail_viewmodel.dart';
import 'package:codigo/viewmodel/popular_movie_viewmodel.dart';
import 'package:codigo/viewmodel/upcoming_movie_viewmodel.dart';
import 'package:codigo/viewmodel/user_viewmodel.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserViewModel());
    Get.lazyPut(() => PopularMovieViewModel());
    Get.lazyPut(() => UpcomingMovieViewModel());
  }
}
