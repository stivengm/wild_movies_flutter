import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wild_movies_flutter/core/models/movies_test.dart';
import 'package:wild_movies_flutter/gui/app_style.dart';
import 'package:wild_movies_flutter/gui/views/movie_information_view/movie_information_view.dart';
import 'package:wild_movies_flutter/gui/widgets/primary_button_widget.dart';
import 'package:wild_movies_flutter/gui/widgets/stars_ratings_widget.dart';

class ItemRecomendations extends StatelessWidget {
  final SeriesModel movie;

  const ItemRecomendations({ Key? key, required this.movie }) : super( key: key );

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MovieInformationView(movie: movie,))),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          children: [
            Container(
              height: 178.0,
              width: 120.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://image.tmdb.org/t/p/w500/${movie.posterPath}'),
                  fit: BoxFit.contain
                ),
                borderRadius: BorderRadius.circular(8.0)
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: SizedBox(
                  height: 178.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      Text(movie.name!, style: Theme.of(context).textTheme.headline6!.copyWith( color: AppStyle.whiteColor )),
                      StarsRatings(voteAverage: movie.voteAverage!),
                      Text("IMDb: ${movie.voteAverage}", style: Theme.of(context).textTheme.headlineSmall!.copyWith( color: AppStyle.greyColor, fontSize: 10.0 ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: media.width * .35,
                            child: const PrimaryButton(text: 'Watch now', color: AppStyle.backgroundColor)
                          ),
                          IconButton(
                            icon: const Icon(
                              MdiIcons.heartOutline,
                              color: AppStyle.greyColor,
                            ),
                            onPressed: () {}
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}