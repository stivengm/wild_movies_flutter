import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wild_movies_flutter/core/blocs/home_bloc/home_bloc.dart';
import 'package:wild_movies_flutter/gui/app_style.dart';
import 'package:wild_movies_flutter/gui/views/home_view/page_view.dart';
import 'package:wild_movies_flutter/gui/widgets/app_bar_widget.dart';
import 'package:wild_movies_flutter/gui/widgets/loading.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  PageController pageController = PageController();

  @override
  void initState() {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.getConfiguration();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return state.isLoadingConfig ? const Loading() :
        Scaffold(
          appBar: AppBarWidget(actions: state.currentIndex == 3 ? false : true),
          body: PageViewWidget(
            pageController: pageController,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppStyle.bottomNavigationBarColor,
            selectedItemColor: AppStyle.primaryColor,
            unselectedItemColor: AppStyle.greyColor,
            currentIndex: state.currentIndex,
            onTap: (i) => getNameScreen(i),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(MdiIcons.homeOutline), label: 'Inicio'),
              BottomNavigationBarItem(
                  icon: Icon(MdiIcons.heartOutline), label: 'Favoritos'),
              BottomNavigationBarItem(
                  icon: Icon(MdiIcons.restart), label: 'Reciente'),
              BottomNavigationBarItem(
                  icon: Icon(MdiIcons.magnify), label: 'Buscar'),
            ],
          ),
        );
      },
    );
  }

  getNameScreen(i) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
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
    homeBloc
        .add(HandleChangeCurrentIndex(currentIndex: i, nameScreen: nameScreen));
    pageController.animateToPage(i,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
  }
}