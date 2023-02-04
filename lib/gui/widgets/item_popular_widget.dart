import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:wild_movies_flutter/core/models/movies_populares_models.dart';
import 'package:wild_movies_flutter/core/models/movies_test.dart';
import 'package:wild_movies_flutter/gui/app_style.dart';
import 'package:wild_movies_flutter/gui/views/movie_information_view/movie_information_view.dart';

class ItemPopular extends StatelessWidget {
  final SeriesModel movie;
  final int index;

  const ItemPopular({ Key? key, required this.movie, required this.index }) : super( key: key );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MovieInformationView(movie: movie,))),
      child: Container(
        width: 120.0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 178.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://image.tmdb.org/t/p/w500/${movie.posterPath}'),
                  fit: BoxFit.contain
                ),
                borderRadius: BorderRadius.circular(8.0)
              ),
            ),
            const SizedBox(height: 5.0),
            Expanded(
              child: Text(movie.name!, style: Theme.of(context).textTheme.headline6!.copyWith( color: AppStyle.whiteColor, fontSize: 15.0 ), textAlign: TextAlign.center,),
            ),
            const SizedBox(height: 10.0),
            RatingStars(
              value: movie.voteAverage!,
              starBuilder: (index, color) => Icon(
                MdiIcons.star,
                color: color,
                size: 15.0,
              ),
              starCount: 5,
              starSize: 15,
              maxValue: 10,
              starSpacing: 0,
              maxValueVisibility: true,
              valueLabelVisibility: false,
              animationDuration: const Duration(milliseconds: 1000),
              valueLabelPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
              valueLabelMargin: const EdgeInsets.only(right: 8),
              starOffColor: const Color(0xffe7e8ea),
              starColor: AppStyle.greyColor,
            ),
          ],
        ),
      ),
    );
  }
}