import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wild_movies_flutter/core/blocs/home_bloc/home_bloc.dart';
import 'package:wild_movies_flutter/gui/app_style.dart';
import 'package:wild_movies_flutter/gui/views/see_more_view/see_more_view.dart';
import 'package:wild_movies_flutter/gui/widgets/header_text_widget.dart';
import 'package:wild_movies_flutter/gui/widgets/item_popular_widget.dart';

class PopularSection extends StatefulWidget {
  const PopularSection({ Key? key }) : super( key: key );

  @override
  State<PopularSection> createState() => _PopularSectionState();
}

class _PopularSectionState extends State<PopularSection> {

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {

      if ( scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500 ) {

      }

      print( scrollController.position.pixels );
      print( scrollController.position.maxScrollExtent );

    });

  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderTextWidget(text: 'Popular'),
              state.popularesMovies != null ? Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                height: 270.0,
                child: ListView.builder(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: state.popularesMovies!.results!.length,
                  itemBuilder: (context, index) {
                    return ItemPopular(movie: state.popularesMovies!.results![index], index: index);
                  }
                ),
              ) : const SizedBox(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context, 
                          'seeMore',
                          arguments: SeeMoreViewArguments(
                            'Populares'
                          ));
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Ver más",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      color: AppStyle.primaryColor,
                                      fontSize: 13.0)),
                          const Icon(
                              size: 17.0,
                              color: AppStyle.primaryColor,
                              Icons.chevron_right_outlined)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}