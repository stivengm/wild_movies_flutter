import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wild_movies_flutter/gui/app_style.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({ Key? key }) : super( key: key );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppStyle.transparent,
      elevation: 0,
      title: Text("Home"),
      actions: [
        IconButton(
          color: Colors.red,
          icon: SvgPicture.asset('assets/icons/settings.svg'),
          onPressed: () =>  Navigator.pushNamed(context, 'settings'), 
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight( kToolbarHeight );

}