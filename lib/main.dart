import 'package:flutter/material.dart';
import 'package:wild_movies_flutter/core/paths/app_paths.dart';
import 'package:wild_movies_flutter/gui/app_style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppStyle.backgroundColor
      ),
      routes: routesApp(),
      initialRoute: 'home',
    );
  }
}

