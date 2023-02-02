import 'package:flutter/material.dart';

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
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.black,
        ),
        Container(
          color: Colors.blue,
        ),
        Container(
          color: Colors.yellow,
        ),
      ],
    );
  }
}