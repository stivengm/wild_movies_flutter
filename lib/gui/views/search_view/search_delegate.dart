import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wild_movies_flutter/core/models/movies_test.dart';
import 'package:wild_movies_flutter/gui/app_style.dart';
import 'package:wild_movies_flutter/core/blocs/home_bloc/home_bloc.dart';

class MovieSearchDelegate extends SearchDelegate {

  @override
  String get searchFieldLabel => 'Buscar película, serie...';

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      scaffoldBackgroundColor: AppStyle.backgroundColor,
      hintColor: AppStyle.greyColor,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: AppStyle.backgroundColor,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppStyle.whiteColor
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 3, color: AppStyle.transparent)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 3, color: AppStyle.transparent),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      textTheme: const TextTheme(
        headline6: TextStyle(
          color: AppStyle.whiteColor
        )
      )
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Icons.clear
        ),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back_rounded
      ),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("buildResults");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    final popularesMovies = homeBloc.state.popularesMovies!.results!;

    if (query.isEmpty) {
      return ListView.builder(
        itemCount: popularesMovies.length,
        itemBuilder: ( _ , index) => ItemResults(popularesMovies[index])
      );
    }

    return Text("buildSuggestions: $query");
  }

}

class ItemResults extends StatelessWidget {
  final SeriesModel movie;
  const ItemResults(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    movie.heroId = 'search-${movie.id}';
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
      leading: Hero(
        tag: movie.heroId!,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: FadeInImage(
            placeholder: const AssetImage('assets/no-image.jpg'),
            image: NetworkImage('https://image.tmdb.org/t/p/w500${movie.posterPath}'),
            fit: BoxFit.cover,
            height: 100.0,
          ),
        ),
      ),
      title: Text("${movie.name}"),
      subtitle: Text("${movie.overview}", style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 10.0), maxLines: 2),
      onTap: () => Navigator.pushNamed(context, 'moreInformation', arguments: movie),
    );
  }
}