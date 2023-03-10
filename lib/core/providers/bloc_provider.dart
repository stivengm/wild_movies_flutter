
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wild_movies_flutter/core/blocs/home_bloc/home_bloc.dart';
import 'package:wild_movies_flutter/core/blocs/search/search_bloc.dart';
import 'package:wild_movies_flutter/core/blocs/see_more_bloc/see_more_bloc.dart';

final List<BlocProvider> providerBloc = [
  BlocProvider<HomeBloc>(create: ( _ ) => HomeBloc()),
  BlocProvider<SeeMoreBloc>(create: ( _ ) => SeeMoreBloc()),
  BlocProvider<SearchBloc>(create: ( _ ) => SearchBloc())
];