import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:http/http.dart' as http;
import 'package:wild_movies_flutter/core/models/config_aplication_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HandleChangeCurrentIndex>((event, emit) {
      emit( state.copyWith( currentIndex: event.currentIndex, nameScreen: event.nameScreen ) );
    });

    on<HandleLoading>((event, emit) {
      emit( state.copyWith( isLoadingConfig: event.isLoadingConfig ) );
    });

  }

  getConfiguration() async {
    add( const HandleLoading(isLoadingConfig: true) );
    var uri = Uri.https('wildmovies-3f7eb-default-rtdb.firebaseio.com', 'aplication.json');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final ConfigAplicationModel configAplicationModel = ConfigAplicationModel.fromRawJson(response.body);
      add( const HandleLoading(isLoadingConfig: false) );
    }

  }

  getPopular() async {
    // Loading true!
    try {
      var url = Uri.https('');
    } catch (e) {
      
    }
  }

}
