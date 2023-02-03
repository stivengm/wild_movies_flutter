part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HandleLoading extends HomeEvent {
  final bool? isLoadingConfig;
  const HandleLoading({
    this.isLoadingConfig
  });
}

class HandleChangeCurrentIndex extends HomeEvent {
  final int currentIndex;
  final String nameScreen;
  const HandleChangeCurrentIndex({
    required this.currentIndex,
    required this.nameScreen
  });
}
