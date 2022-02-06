import 'package:codigo/model/movieModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class MovieItemView extends StatelessWidget {
  MovieItemView(this.movie, this.updateFavStatus);
  final Movie movie;
  Function updateFavStatus;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: NetworkImage(movie.posterPath),
            fit: BoxFit.fitHeight,
          ),
          Text(
            movie.title,
            softWrap: true,
            style: kTitleSmallTextStyle,
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  var _movie = movie;
                  _movie.isFav = 1;
                  updateFavStatus(_movie);
                },
                child: movie.isFav == 1
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
                '${(double.parse(movie.voteAverage) * 10).toInt()} %',
                style: kTitleSmallTextStyle,
              )
            ],
          )
        ],
      ),
    );
  }
}
