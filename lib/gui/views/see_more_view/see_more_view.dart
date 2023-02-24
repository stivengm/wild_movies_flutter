import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wild_movies_flutter/core/blocs/home_bloc/home_bloc.dart';
import 'package:wild_movies_flutter/core/blocs/see_more_bloc/see_more_bloc.dart';
import 'package:wild_movies_flutter/gui/app_style.dart';
import 'package:wild_movies_flutter/gui/widgets/app_bar_widget.dart';
import 'package:wild_movies_flutter/gui/widgets/primary_button_widget.dart';
import 'package:wild_movies_flutter/gui/widgets/stars_ratings_widget.dart';

class SeeMoreView extends StatelessWidget {
  const SeeMoreView({ Key? key }) : super( key: key );

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    final args = ModalRoute.of(context)!.settings.arguments as SeeMoreViewArguments;
    final List<Widget> actionsSeeMore = [
      IconButton(
        color: AppStyle.whiteColor,
        icon: const Icon(
          MdiIcons.heartOutline
        ),
        onPressed: () => {},
      )
    ];
    return Scaffold(
      appBar: AppBarWidget(nameScreen: args.titleSection, centerTitle: false, actions: actionsSeeMore,),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Container(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: cardSwiper(context)
                  ),
                  BlocBuilder<SeeMoreBloc, SeeMoreState>(
                    builder: (context, stateSeeMore) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 40.0),
                        child: Column(
                          children: [
                            Text(stateSeeMore.nameMovie != '' ? stateSeeMore.nameMovie : state.popularesMovies!.results![0].name!, style: Theme.of(context).textTheme.headline6!.copyWith( color: AppStyle.whiteColor, fontSize: 28.0 ),),
                            const SizedBox(height: 20.0),
                            const StarsRatings(voteAverage: 5.0),
                            const SizedBox(height: 20.0),
                            Text("IMDb: ${5.0}", style: Theme.of(context).textTheme.headlineSmall!.copyWith( color: AppStyle.greyColor, fontSize: 10.0 ),),
                            const SizedBox(height: 20.0),
                            SizedBox(
                              width: media.width * .4,
                              child: const PrimaryButton(text: 'Watch now', color: AppStyle.backgroundColor)
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
        },
      ),
    );
  }


  Widget cardSwiper(context) {
    Size media = MediaQuery.of(context).size;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: media.height * .6,
          child: Swiper(
            itemCount: state.popularesMovies!.results!.length,
            layout: SwiperLayout.DEFAULT,
            itemWidth: media.width * .6,
            itemHeight: media.height * 9,
            onIndexChanged: (value) => onIndexChanged(value, context),
            scale: 0.8,
            viewportFraction: 0.8,
            itemBuilder: (context, index) {

              final movie = state.popularesMovies!.results![index];
              
              return ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image: NetworkImage('https://image.tmdb.org/t/p/w500${movie.posterPath}'),
                  fit: BoxFit.cover,
                ),
              );
    
            },
          ),
        );
      },
    );
  }

  onIndexChanged(index, context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    final seeMoreBloc = BlocProvider.of<SeeMoreBloc>(context);
    seeMoreBloc.add( HandleInformationMovie(
      nameMovie: homeBloc.state.popularesMovies!.results![index].name!)
    );
  }

}

class SeeMoreViewArguments {
  final String titleSection;

  SeeMoreViewArguments(this.titleSection);
}