import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wild_movies_flutter/gui/app_style.dart';
import 'package:wild_movies_flutter/gui/views/home_view/page_view.dart';
import 'package:wild_movies_flutter/gui/widgets/app_bar_widget.dart';
import 'package:wild_movies_flutter/gui/widgets/header_text_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({ Key? key }) : super( key: key );

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: PageViewWidget(pageController: pageController,),
      // body: Column(
      //   children: [
      //     _popular(context),
      //     const Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 20.0),
      //       child: Divider(
      //         color: AppStyle.greyColor,
      //       ),
      //     ),
      //   ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppStyle.bottomNavigationBarColor,
        elevation: 0,
        selectedItemColor: AppStyle.primaryColor,
        unselectedItemColor: AppStyle.greyColor,
        onTap: (i) => getNameScreen(i),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.homeOutline
            ),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.heartOutline
            ),
            label: 'Favoritos'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.restart
            ),
            label: 'Reciente'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.magnify
            ),
            label: 'Buscar'
          ),
        ],
      ),
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
                      Text("Ver más", style: Theme.of(context).textTheme.headline6!.copyWith( color: AppStyle.primaryColor, fontSize: 13.0 )),
                      const Icon(
                        size: 17.0,
                        color: AppStyle.primaryColor,
                        Icons.chevron_right_outlined
                      )
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

  getNameScreen(i) {
    String nameScreen = "";
    switch (i) {
      case 0:
        nameScreen = 'Inicio';
        break;
      case 1:
        nameScreen = 'Favoritos';
        break;
      case 2:
        nameScreen = 'Reciente';
        break;
      case 3:
        nameScreen = 'Buscar';
    }
    pageController.animateToPage(i, duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
  }
}