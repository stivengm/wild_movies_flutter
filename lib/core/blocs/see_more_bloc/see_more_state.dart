part of 'see_more_bloc.dart';

class SeeMoreState extends Equatable {
  final String nameMovie;

  const SeeMoreState({
    this.nameMovie = ''
  });

  SeeMoreState copyWith({
    String? nameMovie
  }) => SeeMoreState(
    nameMovie: nameMovie ?? this.nameMovie
  );
  
  @override
  List<Object> get props => [ nameMovie ];
}

class SeeMoreInitial extends SeeMoreState {}
