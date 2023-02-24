import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wild_movies_flutter/core/models/movies_test.dart';
import 'package:wild_movies_flutter/gui/app_style.dart';
import 'package:wild_movies_flutter/gui/widgets/app_bar_widget.dart';

class MovieInformationView extends StatelessWidget {
  final SeriesModel movie;
  const MovieInformationView({ 
    Key? key, 
    required this.movie
  }) : super( key: key );

  @override
  Widget build(BuildContext context) {
    final List<Widget> actionsMovieInformation = [
      IconButton(
        color: AppStyle.whiteColor,
        icon: const Icon(
          MdiIcons.heartOutline
        ),
        onPressed: () => {},
      )
    ];
    Size media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidget(nameScreen: movie.name, centerTitle: false, actions: actionsMovieInformation,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: media.height * .2349,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://image.tmdb.org/t/p/w500/${movie.backdropPath}'),
                    fit: BoxFit.contain
                  ),
                  borderRadius: BorderRadius.circular(8.0)
                ),
              ),
              const SizedBox(height: 30),
              Text(movie.name!, style: Theme.of(context).textTheme.headline6!.copyWith( color: AppStyle.whiteColor, fontSize: 30.0 ),),
              Row(
                children: [
                  Text("IMDb: ${movie.voteAverage}", style: Theme.of(context).textTheme.headlineSmall!.copyWith( color: AppStyle.greyColor, fontSize: 10.0 ),),
                  const Text(" | "),
                  Text(movie.firstAirDate.toString(), style: Theme.of(context).textTheme.headlineSmall!.copyWith( color: AppStyle.greyColor, fontSize: 10.0 ),),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Divider(
                  color: AppStyle.greyColor,
                ),
              ),
              Text(movie.overview!, style: Theme.of(context).textTheme.headline6!. copyWith( color: AppStyle.greyColor, fontSize: 13.0 ),)
            ],
          ),
        ),
      ),
    );
  }
}