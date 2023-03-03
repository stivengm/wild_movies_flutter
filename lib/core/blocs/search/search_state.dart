part of 'search_bloc.dart';

class SearchState extends Equatable {
  final SearchMovieModel? searchMovies;
  final bool searchLoading;

  const SearchState({
    this.searchMovies,
    this.searchLoading = false
  });

  SearchState copyWith({
    SearchMovieModel? searchMovies,
    bool? searchLoading,
  }) => SearchState(
    searchMovies: searchMovies ?? this.searchMovies,
    searchLoading: searchLoading ?? this.searchLoading
  );
  
  @override
  List<Object?> get props => [ searchLoading, searchMovies ];
}

class SearchInitial extends SearchState {}
