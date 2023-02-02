part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int currentIndex;
  final String nameScreen;

  const HomeState({
    this.currentIndex = 0,
    this.nameScreen = 'Inicio'
  });

  HomeState copyWith({
    int? currentIndex,
    String? nameScreen,
  }) => HomeState(
    currentIndex: currentIndex ?? this.currentIndex,
    nameScreen: nameScreen ?? this.nameScreen
  );
  
  @override
  List<Object> get props => [ nameScreen, currentIndex ];
}

class HomeInitial extends HomeState {}
