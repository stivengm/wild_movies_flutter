part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isLoadingConfig;
  final int currentIndex;
  final String nameScreen;

  const HomeState({
    this.isLoadingConfig = true,
    this.currentIndex = 0,
    this.nameScreen = 'Inicio'
  });

  HomeState copyWith({
    bool? isLoadingConfig,
    int? currentIndex,
    String? nameScreen,
  }) => HomeState(
    isLoadingConfig: isLoadingConfig ?? this.isLoadingConfig,
    currentIndex: currentIndex ?? this.currentIndex,
    nameScreen: nameScreen ?? this.nameScreen
  );
  
  @override
  List<Object> get props => [ nameScreen, currentIndex, isLoadingConfig ];
}

class HomeInitial extends HomeState {}
