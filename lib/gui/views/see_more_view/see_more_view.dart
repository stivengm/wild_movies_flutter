import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return Scaffold(
      appBar: AppBarWidget(nameScreen: args.titleSection, centerTitle: false),
      body: Stack(
        children: [
          const _Background(),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Container(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                      AppStyle.backgroundColor,
                      AppStyle.backgroundColor.withOpacity(.9),
                      ],
                    )
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: cardSwiper(context)
                      ),
                      BlocBuilder<SeeMoreBloc, SeeMoreState>(
                        builder: (context, stateSeeMore) {
                          return Container(
                            padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 10.0),
                            child: Column(
                              children: [
                                Text(stateSeeMore.nameMovie ?? state.popularesMovies!.results![0].name!, style: Theme.of(context).textTheme.headline6!.copyWith( color: AppStyle.whiteColor, fontSize: 28.0 ), textAlign: TextAlign.center,),
                                const SizedBox(height: 20.0),
                                StarsRatings(voteAverage: stateSeeMore.voteAverage ?? state.popularesMovies!.results![0].voteAverage!),
                                const SizedBox(height: 20.0),
                                Text("IMDb: ${stateSeeMore.voteAverage ?? state.popularesMovies!.results![0].voteAverage!}", style: Theme.of(context).textTheme.headlineSmall!.copyWith( color: AppStyle.greyColor, fontSize: 10.0 ),),
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
        ],
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
              movie.heroId = 'swiper-${movie.id}';
              
              return GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'moreInformation', arguments: movie),
                child: Hero(
                  tag: movie.heroId!,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: FadeInImage(
                      placeholder: const AssetImage('assets/no-image.jpg'),
                      image: NetworkImage('https://image.tmdb.org/t/p/w500${movie.posterPath}'),
                      fit: BoxFit.cover,
                    ),
                  ),
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
      nameMovie: homeBloc.state.popularesMovies!.results![index].name!,
      voteAverage: homeBloc.state.popularesMovies!.results![index].voteAverage!,
      posterPath: homeBloc.state.popularesMovies!.results![index].posterPath
    ));
  }

}


class _Background extends StatelessWidget {
  const _Background({ Key? key }) : super( key: key );

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return BlocBuilder<SeeMoreBloc, SeeMoreState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: media.height * 1,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://image.tmdb.org/t/p/w500${state.posterPath ?? homeBloc.state.popularesMovies!.results![0].posterPath}'),
              fit: BoxFit.cover,
              alignment: Alignment.center
            )
          ),
        );
      },
    );
  }
}


class SeeMoreViewArguments {
  final String titleSection;

  SeeMoreViewArguments(this.titleSection);
}