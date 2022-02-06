import 'dart:ffi';

import 'package:codigo/constant.dart';
import 'package:codigo/viewmodel/popular_movie_viewmodel.dart';
import 'package:codigo/viewmodel/upcoming_movie_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get_storage/get_storage.dart';

import 'movie_detail_view.dart';

class MoviesListView extends StatefulWidget {
  const MoviesListView({Key? key}) : super(key: key);

  @override
  State<MoviesListView> createState() => _MoviesListViewState();
}

class _MoviesListViewState extends State<MoviesListView> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation) => Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Recommended',
                      style: kTitleTextStyle,
                    ),
                    SizedBox(
                      height: 400,
                      child: GetBuilder<PopularMovieViewModel>(
                        init: Get.find<PopularMovieViewModel>(),
                        builder: (controller) => controller.isLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ListView.builder(
                                physics: const AlwaysScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.all(0),
                                shrinkWrap: true,
                                itemCount: controller.movies.length,
                                itemBuilder: (ctx, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        MovieDetailView(
                                            controller.movies[index], true),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image(
                                            image: NetworkImage(controller
                                                .movies[index].posterPath),
                                            fit: BoxFit.fitHeight,
                                          ),
                                          Text(
                                            controller.movies[index].title,
                                            softWrap: true,
                                            style: kTitleSmallTextStyle,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              GestureDetector(
                                                onTap: () {
                                                  var movie =
                                                      controller.movies[index];
                                                  movie.isFav = controller
                                                              .movies[index]
                                                              .isFav ==
                                                          0
                                                      ? 1
                                                      : 0;
                                                  controller.updateMovie(movie);
                                                },
                                                child: controller.movies[index]
                                                            .isFav ==
                                                        1
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
                                                '${(double.parse(controller.movies[index].voteAverage) * 10).toInt()} %',
                                                style: kTitleSmallTextStyle,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                      ),
                    ),
                    const Text(
                      'Upcoming Movies',
                      style: kTitleTextStyle,
                    ),
                    GetBuilder<UpcomingMovieViewModel>(
                      init: Get.find<UpcomingMovieViewModel>(),
                      builder: (controller) => controller.isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              physics: const AlwaysScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              padding: const EdgeInsets.all(0),
                              shrinkWrap: true,
                              itemCount: controller.movies.length,
                              itemBuilder: (ctx, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      MovieDetailView(
                                          controller.movies[index], false),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image(
                                          image: NetworkImage(controller
                                              .movies[index].posterPath),
                                          fit: BoxFit.fitHeight,
                                        ),
                                        Text(
                                          controller.movies[index].title,
                                          softWrap: true,
                                          style: kTitleSmallTextStyle,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            GestureDetector(
                                              onTap: () {
                                                var movie =
                                                    controller.movies[index];
                                                movie.isFav = controller
                                                            .movies[index]
                                                            .isFav ==
                                                        0
                                                    ? 1
                                                    : 0;
                                                controller.updateMovie(movie);
                                              },
                                              child: controller.movies[index]
                                                          .isFav ==
                                                      1
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
                                              '${(double.parse(controller.movies[index].voteAverage) * 10).toInt()} %',
                                              style: kTitleSmallTextStyle,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                    ),
                  ],
                ),
              ),
            )));
  }
}
