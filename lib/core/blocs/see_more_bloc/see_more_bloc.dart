import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'see_more_event.dart';
part 'see_more_state.dart';

class SeeMoreBloc extends Bloc<SeeMoreEvent, SeeMoreState> {
  SeeMoreBloc() : super(SeeMoreInitial()) {
    on<SeeMoreEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<HandleInformationMovie>((event, emit) {
      emit( state.copyWith( nameMovie: event.nameMovie ) );
    });

  }
}
