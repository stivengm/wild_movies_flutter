import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wild_movies_flutter/gui/app_style.dart';

class StarsRatings extends StatelessWidget {
  final double voteAverage;
  const StarsRatings({ Key? key, required this.voteAverage }) : super( key: key );

  @override
  Widget build(BuildContext context) {
    return RatingStars(
      value: voteAverage,
      starBuilder: (index, color) => Icon(
        MdiIcons.star,
        color: color,
        size: 15.0,
      ),
      starCount: 5,
      starSize: 15,
      maxValue: 10,
      starSpacing: 0,
      maxValueVisibility: true,
      valueLabelVisibility: false,
      animationDuration: const Duration(milliseconds: 1000),
      valueLabelPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
      valueLabelMargin: const EdgeInsets.only(right: 8),
      starOffColor: const Color(0xffe7e8ea),
      starColor: AppStyle.greyColor,
    );
  }
}