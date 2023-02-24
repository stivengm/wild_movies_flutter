import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wild_movies_flutter/gui/app_style.dart';
import 'package:wild_movies_flutter/gui/widgets/app_bar_widget.dart';

class SeeMoreView extends StatelessWidget {
  const SeeMoreView({ Key? key }) : super( key: key );

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SeeMoreViewArguments;
    final List<Widget> actionsSeeMore = [
      IconButton(
        color: AppStyle.whiteColor,
        icon: const Icon(
          MdiIcons.heartOutline
        ),
        onPressed: () => {},
      )
    ];
    return Scaffold(
      appBar: AppBarWidget(nameScreen: args.titleSection, centerTitle: false, actions: actionsSeeMore,),
    );
  }
}

class SeeMoreViewArguments {
  final String titleSection;

  SeeMoreViewArguments(this.titleSection);
}