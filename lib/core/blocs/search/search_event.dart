part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchMovies extends SearchEvent {
  final SearchMovieModel searchMovies;
  const SearchMovies(this.searchMovies);
}

class HandleLoading extends SearchEvent {
  final bool searchLoading;
  const HandleLoading(this.searchLoading);
}