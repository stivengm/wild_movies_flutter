part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HandleChangeCurrentIndex extends HomeEvent {
  final int currentIndex;
  final String nameScreen;
  const HandleChangeCurrentIndex({
    required this.currentIndex,
    required this.nameScreen
  });
}
