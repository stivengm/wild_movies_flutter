import 'package:flutter/material.dart';
import 'package:wild_movies_flutter/gui/views/home_view/home_view.dart';

Map<String, WidgetBuilder> routesApp() => <String, WidgetBuilder> {

  'home': ( _ ) => const HomeView()

};