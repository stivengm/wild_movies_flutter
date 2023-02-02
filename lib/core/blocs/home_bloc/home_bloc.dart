import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HandleChangeCurrentIndex>((event, emit) {
      emit( state.copyWith( currentIndex: event.currentIndex, nameScreen: event.nameScreen ) );
    });
  }
}
