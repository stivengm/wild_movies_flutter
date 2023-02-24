import 'package:flutter/material.dart';
import 'package:wild_movies_flutter/gui/views/home_view/home_view.dart';
import 'package:wild_movies_flutter/gui/views/login_view/login_view.dart';
import 'package:wild_movies_flutter/gui/views/see_more_view/see_more_view.dart';
import 'package:wild_movies_flutter/gui/views/settings_view/settings_view.dart';

Map<String, WidgetBuilder> routesApp() => <String, WidgetBuilder> {

  'home': ( _ ) => const HomeView(),
  'login': ( _ ) => const LoginView(),
  'seeMore': ( _ ) => const SeeMoreView(),
  'settings': ( _ ) => const SettingsView(),

};