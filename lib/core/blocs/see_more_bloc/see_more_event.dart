part of 'see_more_bloc.dart';

abstract class SeeMoreEvent extends Equatable {
  const SeeMoreEvent();

  @override
  List<Object> get props => [];
}

class HandleInformationMovie extends SeeMoreEvent {
  final String nameMovie;
  final double? voteAverage;
  final String? posterPath;
  const HandleInformationMovie({ required this.nameMovie, this.voteAverage, this.posterPath });
}
