import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({ Key? key }) : super( key: key );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Home"),
      actions: [
        IconButton(
          color: Colors.red,
          icon: SvgPicture.asset('assets/icons/settings.svg'),
          onPressed: () {}, 
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight( kToolbarHeight );

}