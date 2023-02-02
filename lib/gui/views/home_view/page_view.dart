import 'package:flutter/material.dart';
import 'package:wild_movies_flutter/gui/app_style.dart';
import 'package:wild_movies_flutter/gui/views/search_view/search_view.dart';
import 'package:wild_movies_flutter/gui/widgets/header_text_widget.dart';

class PageViewWidget extends StatefulWidget {
  final PageController pageController;
  const PageViewWidget({ Key? key, required this.pageController }) : super( key: key );

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
        Column(
          children: [
            _popular(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(
                color: AppStyle.greyColor,
              ),
            ),
          ],
        ),
        Container(
        ),
        Container(
        ),
        const SearchView(),
      ],
    );
  }

  Widget _popular() {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderTextWidget(text: 'Popular'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                GestureDetector(
                  onTap: () {
                    print("Ver más...");
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Ver más",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color: AppStyle.primaryColor,
                                  fontSize: 13.0)),
                      const Icon(
                          size: 17.0,
                          color: AppStyle.primaryColor,
                          Icons.chevron_right_outlined)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}