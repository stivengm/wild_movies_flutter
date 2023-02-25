import 'package:flutter/material.dart';
// import 'package:wild_movies_flutter/core/models/movies_populares_models.dart';
import 'package:wild_movies_flutter/core/models/movies_test.dart';
import 'package:wild_movies_flutter/gui/app_style.dart';
import 'package:wild_movies_flutter/gui/widgets/stars_ratings_widget.dart';

class ItemPopular extends StatelessWidget {
  final SeriesModel movie;
  final int index;

  const ItemPopular({ Key? key, required this.movie, required this.index }) : super( key: key );

  @override
  Widget build(BuildContext context) {
    movie.heroId = 'popular-${movie.id}';
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'moreInformation', arguments: movie),
      child: Container(
        width: 120.0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: movie.heroId!,
              child: Container(
                height: 178.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://image.tmdb.org/t/p/w500/${movie.posterPath}'),
                    fit: BoxFit.contain
                  ),
                  borderRadius: BorderRadius.circular(8.0)
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            Expanded(
              child: Text(movie.name!, style: Theme.of(context).textTheme.headline6!.copyWith( color: AppStyle.whiteColor, fontSize: 15.0 ), textAlign: TextAlign.center,),
            ),
            const SizedBox(height: 10.0),
            StarsRatings(voteAverage: movie.voteAverage!)
          ],
        ),
      ),
    );
  }
}