import 'package:flutter/material.dart';
import 'package:wild_movies_flutter/core/models/movies_test.dart';
import 'package:wild_movies_flutter/gui/app_style.dart';
import 'package:wild_movies_flutter/gui/widgets/stars_ratings_widget.dart';



class MovieInformationView extends StatelessWidget {
  const MovieInformationView({ Key? key }) : super( key: key );

  @override
  Widget build(BuildContext context) {

    final SeriesModel movie = ModalRoute.of(context)!.settings.arguments as SeriesModel;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(movie),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(movie),
              _Overview(movie)
            ])
          ),
        ],
      )
    );
  }

}


class _CustomAppBar extends StatelessWidget {
  final SeriesModel movie;

  const _CustomAppBar(this.movie);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppStyle.backgroundColor,
      expandedHeight: 200,
      elevation: 0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(0),
        centerTitle: true,
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: AppStyle.backgroundColor.withOpacity(.3),
          child: Text("${movie.name}", style: Theme.of(context).textTheme.headline6!.copyWith( fontSize: 16.0, color: AppStyle.whiteColor ), textAlign: TextAlign.center,),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/no-image.jpg'),
          image: NetworkImage('https://image.tmdb.org/t/p/w500${movie.backdropPath}'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final SeriesModel movie;

  const _PosterAndTitle(this.movie);
  
    @override
    Widget build(BuildContext context) {
      return Container(
        margin: const EdgeInsets.only( top: 20.0 ),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Hero(
              tag: movie.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image: NetworkImage('https://image.tmdb.org/t/p/w500${movie.posterPath}'),
                  height: 200.0,
                ),
              ),
            ),
            const SizedBox( width: 20.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${movie.name}", style: Theme.of(context).textTheme.headline5!.copyWith( color: AppStyle.whiteColor ), overflow: TextOverflow.ellipsis, maxLines: 2,),
                  const SizedBox(height: 20.0),
                  StarsRatings(voteAverage: movie.voteAverage!),
                  Text("IMDb: ${movie.voteAverage}", style: Theme.of(context).textTheme.subtitle2!.copyWith( color: AppStyle.greyColor, fontSize: 12.0 ), overflow: TextOverflow.ellipsis, maxLines: 2,),
                ],
              ),
            )
          ],
        ),
      );
    }
  }


class _Overview extends StatelessWidget {
  final SeriesModel movie;

  const _Overview(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Text("${movie.overview}", style: Theme.of(context).textTheme.subtitle2!.copyWith( color: AppStyle.greyColor ),),
    );
  }
}