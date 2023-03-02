import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wild_movies_flutter/gui/app_style.dart';

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
    return Text("buildSuggestions: $query");
  }

}