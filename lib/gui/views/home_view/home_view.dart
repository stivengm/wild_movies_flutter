import 'package:flutter/material.dart';
import 'package:wild_movies_flutter/gui/widgets/app_bar_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({ Key? key }) : super( key: key );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: _body(),
    );
  }

  Widget _body() {
    return Container();
  }

}