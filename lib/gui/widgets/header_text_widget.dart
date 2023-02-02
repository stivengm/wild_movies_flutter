import 'package:flutter/material.dart';
import 'package:wild_movies_flutter/gui/app_style.dart';

class HeaderTextWidget extends StatelessWidget {
  final String text;
  const HeaderTextWidget({ Key? key, required this.text }) : super( key: key );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(text, style: Theme.of(context).textTheme.headline6!.copyWith( color: AppStyle.whiteColor)),
    );
  }
}