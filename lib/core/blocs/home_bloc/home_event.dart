part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HandleLoading extends HomeEvent {
  final bool? isLoadingConfig;
  final bool? isLoadingPopular;
  const HandleLoading({
    this.isLoadingConfig,
    this.isLoadingPopular
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

class HandleConfigApplication extends HomeEvent {
  final ConfigAplicationModel? configurationApplication;
  const HandleConfigApplication(this.configurationApplication);
}

class HandlePopularesMovies extends HomeEvent {
  final PopularesModel? popularesMovies;
  const HandlePopularesMovies(this.popularesMovies);
}