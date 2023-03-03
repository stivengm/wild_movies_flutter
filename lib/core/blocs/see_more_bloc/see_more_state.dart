part of 'see_more_bloc.dart';

class SeeMoreState extends Equatable {
  final String? nameMovie;
  final double? voteAverage;
  final String? posterPath;

  const SeeMoreState({
    this.nameMovie,
    this.voteAverage,
    this.posterPath
  });

  SeeMoreState copyWith({
    String? nameMovie,
    double? voteAverage,
    String? posterPath
  }) => SeeMoreState(
    nameMovie: nameMovie ?? this.nameMovie,
    voteAverage: voteAverage ?? this.voteAverage,
    posterPath: posterPath ?? this.posterPath
  );
  
  @override
  List<Object?> get props => [ nameMovie, voteAverage, posterPath ];
}

class SeeMoreInitial extends SeeMoreState {}
