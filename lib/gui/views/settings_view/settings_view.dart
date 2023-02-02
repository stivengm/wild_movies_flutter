import 'package:flutter/material.dart';
import 'package:wild_movies_flutter/gui/widgets/app_bar_widget.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({ Key? key }) : super( key: key );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
    );
  }
}