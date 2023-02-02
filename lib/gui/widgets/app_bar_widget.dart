import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wild_movies_flutter/core/blocs/home_bloc/home_bloc.dart';
import 'package:wild_movies_flutter/gui/app_style.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final String? nameScreen;
  final bool? actions;
  const AppBarWidget({ Key? key, this.nameScreen, this.actions = true }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return AppBar(
          backgroundColor: AppStyle.transparent,
          elevation: 0,
          title: Text(nameScreen ?? state.nameScreen),
          
          actions: actions! ? [
            IconButton(
              color: Colors.red,
              icon: SvgPicture.asset('assets/icons/settings.svg'),
              onPressed: () => Navigator.pushNamed(context, 'settings'),
            )
          ] : [],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}