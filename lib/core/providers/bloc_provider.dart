
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wild_movies_flutter/core/blocs/home_bloc/home_bloc.dart';

final List<BlocProvider> providerBloc = [
  BlocProvider<HomeBloc>(create: ( _ ) => HomeBloc())
];