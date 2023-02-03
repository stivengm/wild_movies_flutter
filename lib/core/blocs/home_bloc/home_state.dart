part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isLoadingConfig;
  final bool isLoadingPopular;
  final ConfigAplicationModel? configurationApplication;
  final PopularesModel? popularesMovies;
  final int currentIndex;
  final String nameScreen;

  const HomeState({
    this.isLoadingConfig = true,
    this.isLoadingPopular = true,
    this.configurationApplication,
    this.popularesMovies,
    this.currentIndex = 0,
    this.nameScreen = 'Inicio'
  });

  HomeState copyWith({
    bool? isLoadingConfig,
    bool? isLoadingPopular,
    ConfigAplicationModel? configurationApplication,
    PopularesModel? popularesMovies,
    int? currentIndex,
    String? nameScreen,
  }) => HomeState(
    isLoadingConfig: isLoadingConfig ?? this.isLoadingConfig,
    isLoadingPopular: isLoadingPopular ?? this.isLoadingPopular,
    configurationApplication: configurationApplication ?? this.configurationApplication,
    popularesMovies: popularesMovies ?? this.popularesMovies,
    currentIndex: currentIndex ?? this.currentIndex,
    nameScreen: nameScreen ?? this.nameScreen
  );
  
  @override
  List<Object?> get props => [ nameScreen, currentIndex, isLoadingConfig, isLoadingPopular, configurationApplication, popularesMovies ];
}

class HomeInitial extends HomeState {}
