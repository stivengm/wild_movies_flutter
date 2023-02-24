part of 'see_more_bloc.dart';

class SeeMoreState extends Equatable {
  final String? nameMovie;
  final double? voteAverage;

  const SeeMoreState({
    this.nameMovie,
    this.voteAverage
  });

  SeeMoreState copyWith({
    String? nameMovie,
    double? voteAverage
  }) => SeeMoreState(
    nameMovie: nameMovie ?? this.nameMovie,
    voteAverage: voteAverage ?? this.voteAverage
  );
  
  @override
  List<Object> get props => [ nameMovie!, voteAverage! ];
}

class SeeMoreInitial extends SeeMoreState {}
