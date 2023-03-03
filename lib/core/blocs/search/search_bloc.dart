import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:http/http.dart' as http;

import 'package:wild_movies_flutter/core/globals.dart';
import 'package:wild_movies_flutter/core/models/search_movides_model.dart';


part 'search_event.dart';
part 'search_state.dart';


class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {

    on<SearchMovies>((event, emit) {
      emit( state.copyWith( searchMovies: event.searchMovies ) );
    });

    on<HandleLoading>((event, emit) {
      emit( state.copyWith( searchLoading: event.searchLoading ) );
    });
  }


  Future<List<ResultSearch>> getSearchMovies(String query) async {
    add( const HandleLoading(true) );
    final url = Uri.https(configDataGlobalsApp.baseUrl!, '3/search/movie', {
      'api_key': configDataGlobalsApp.apiKey,
      'language': configDataGlobalsApp.lenguaje,
      'query': query
    });

    final response = await http.get(url);
    final SearchMovieModel movies = SearchMovieModel.fromJson(response.body);
    add( SearchMovies(movies) );
    add( const HandleLoading(false) );
    return movies.results!;
  }

}