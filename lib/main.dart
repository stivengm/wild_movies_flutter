import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wild_movies_flutter/core/paths/app_paths.dart';
import 'package:wild_movies_flutter/core/providers/bloc_provider.dart';
import 'package:wild_movies_flutter/gui/app_style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    return MultiBlocProvider(
      providers: providerBloc, 
      child: mateApp(context)
    );

  }

  MaterialApp mateApp(context) => MaterialApp(
    title: 'WildMoviesApp',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      textTheme: GoogleFonts.montserratTextTheme(
        Theme.of(context).textTheme
      ),
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: AppStyle.backgroundColor
    ),
    routes: routesApp(),
    initialRoute: 'home',
  );
}

