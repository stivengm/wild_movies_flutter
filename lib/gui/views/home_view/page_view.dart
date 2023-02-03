import 'package:flutter/material.dart';
import 'package:wild_movies_flutter/gui/app_style.dart';
import 'package:wild_movies_flutter/gui/views/home_view/popular_section.dart';
import 'package:wild_movies_flutter/gui/views/home_view/recomendations_section.dart';
import 'package:wild_movies_flutter/gui/views/search_view/search_view.dart';

class PageViewWidget extends StatefulWidget {
  final PageController pageController;
  const PageViewWidget({Key? key, required this.pageController})
      : super(key: key);

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: widget.pageController,
      scrollDirection: Axis.horizontal,
      children: [
        _homeView(),
        Container(),
        Container(),
        const SearchView(),
      ],
    );
  }

  Widget _homeView() {
    return ListView(
      children: const [
        PopularSection(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Divider(
            color: AppStyle.greyColor,
          ),
        ),
        SizedBox(height: 15.0),
        RecomendationsSection()
      ],
    );
  }
  
}
