import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:http/http.dart' as http;
import 'package:wild_movies_flutter/core/models/config_aplication_model.dart';
// import 'package:wild_movies_flutter/core/models/movies_populares_models.dart';
import 'package:wild_movies_flutter/core/models/movies_test.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HandleChangeCurrentIndex>((event, emit) {
      emit( state.copyWith( currentIndex: event.currentIndex, nameScreen: event.nameScreen ) );
    });

    on<HandleLoading>((event, emit) {
      emit( state.copyWith( isLoadingConfig: event.isLoadingConfig, isLoadingPopular: event.isLoadingPopular ) );
    });

    on<HandleConfigApplication>((event, emit) {
      emit( state.copyWith( configurationApplication: event.configurationApplication ) );
    });

    on<HandlePopularesMovies>((event, emit) {
      emit( state.copyWith( popularesMovies: event.popularesMovies ) );
    });

  }

  Future getConfiguration() async {
    add( const HandleLoading(isLoadingConfig: true) );
    var uri = Uri.https('wildmovies-3f7eb-default-rtdb.firebaseio.com', 'aplication.json');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final ConfigAplicationModel configAplicationModel = ConfigAplicationModel.fromRawJson(response.body);
      add( HandleConfigApplication(configAplicationModel) );
      add( const HandleLoading(isLoadingConfig: false) );
      getPopular(configAplicationModel);
    }

  }

  getPopular(ConfigAplicationModel configAplicationModel) async {
    add( const HandleLoading(isLoadingPopular: true) );
    try {
      var url = Uri.https(configAplicationModel.baseUrl!, '3/tv/popular', {
        'api_key': configAplicationModel.apiKey,
        'language': configAplicationModel.lenguaje,
        'page': '1'
      });

      final response = await http.get(url);
      if (response.statusCode == 200) {
        final PopularesModel movies = PopularesModel.fromJson(response.body);
        add( HandlePopularesMovies(movies) );
        add( const HandleLoading(isLoadingPopular: false) );
      }

    } catch (e) {
      print(e);
    }
  }

}
