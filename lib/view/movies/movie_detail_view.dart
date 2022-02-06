import 'package:codigo/constant.dart';
import 'package:codigo/model/movieModel.dart';
import 'package:codigo/viewmodel/popular_movie_viewmodel.dart';
import 'package:codigo/viewmodel/upcoming_movie_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class MovieDetailView extends StatelessWidget {
  MovieDetailView(this.movie, this.from_popular);
  final Movie? movie;
  final bool from_popular;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation) => Scaffold(
            appBar: AppBar(
              title: const Text('Movie Detail'),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image(
                    image: NetworkImage(movie!.posterPath),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                  ),
                  from_popular
                      ? GetBuilder<PopularMovieViewModel>(
                          init: Get.find<PopularMovieViewModel>(),
                          builder: (controller) => (Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () async {
                                  var _movie = movie!;

                                  _movie.isFav = movie!.isFav == 0 ? 1 : 0;
                                  controller.updateMovie(_movie);
                                },
                                child: movie!.isFav == 1
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    : const Icon(
                                        Icons.favorite_border,
                                        color: Colors.red,
                                      ),
                              ),
                              Text(
                                '${(double.parse(movie!.voteAverage) * 10).toInt()} %',
                                style: kTitleSmallTextStyle,
                              )
                            ],
                          )),
                        )
                      : GetBuilder<UpcomingMovieViewModel>(
                          init: Get.find<UpcomingMovieViewModel>(),
                          builder: (controller) => (Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () async {
                                  var _movie = movie!;

                                  _movie.isFav = movie!.isFav == 0 ? 1 : 0;
                                  controller.updateMovie(_movie);
                                },
                                child: movie!.isFav == 1
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    : const Icon(
                                        Icons.favorite_border,
                                        color: Colors.red,
                                      ),
                              ),
                              Text(
                                '${(double.parse(movie!.voteAverage) * 10).toInt()} %',
                                style: kTitleSmallTextStyle,
                              )
                            ],
                          )),
                        ),
                  Text(
                    movie!.overview,
                    style: kTitleSmallTextStyle,
                    softWrap: true,
                  ),
                ],
              ),
            )));
  }
}
