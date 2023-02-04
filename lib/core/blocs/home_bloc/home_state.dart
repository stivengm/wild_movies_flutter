part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isLoadingConfig;
  final bool isLoadingPopular;
  final bool isLoadingRecomendations;
  final ConfigAplicationModel? configurationApplication;
  final PopularesModel? popularesMovies;
  final PopularesModel? recomendationsMovies;
  final int currentIndex;
  final String nameScreen;

  const HomeState({
    this.isLoadingConfig = true,
    this.isLoadingPopular = true,
    this.isLoadingRecomendations = true,
    this.configurationApplication,
    this.popularesMovies,
    this.recomendationsMovies,
    this.currentIndex = 0,
    this.nameScreen = 'Inicio'
  });

  HomeState copyWith({
    bool? isLoadingConfig,
    bool? isLoadingPopular,
    bool? isLoadingRecomendations,
    ConfigAplicationModel? configurationApplication,
    PopularesModel? popularesMovies,
    PopularesModel? recomendationsMovies,
    int? currentIndex,
    String? nameScreen,
  }) => HomeState(
    isLoadingConfig: isLoadingConfig ?? this.isLoadingConfig,
    isLoadingPopular: isLoadingPopular ?? this.isLoadingPopular,
    isLoadingRecomendations: isLoadingRecomendations ?? this.isLoadingRecomendations,
    configurationApplication: configurationApplication ?? this.configurationApplication,
    popularesMovies: popularesMovies ?? this.popularesMovies,
    recomendationsMovies: recomendationsMovies ?? this.recomendationsMovies,
    currentIndex: currentIndex ?? this.currentIndex,
    nameScreen: nameScreen ?? this.nameScreen
  );
  
  @override
  List<Object?> get props => [ nameScreen, currentIndex, isLoadingConfig, isLoadingPopular, isLoadingRecomendations, configurationApplication, popularesMovies, recomendationsMovies ];
}

class HomeInitial extends HomeState {}
