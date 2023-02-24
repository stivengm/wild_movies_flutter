import 'package:flutter/material.dart';
import 'package:wild_movies_flutter/gui/app_style.dart';
import 'package:wild_movies_flutter/gui/widgets/app_bar_widget.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({ Key? key }) : super( key: key );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(nameScreen: 'Ajustes'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: Column(
              children: [
                ListTile(
                  title: Text("Iniciar sesión", style: Theme.of(context).textTheme.headline6!.copyWith( color: AppStyle.whiteColor )),
                  onTap: () => Navigator.pushNamed(context, 'login'),
                ),
              ]
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Text("Versión: 1.0.0", style: Theme.of(context).textTheme.headline6!.copyWith( color: AppStyle.greyColor, fontSize: 11.0 ),),
          )
        ],
      ),
    );
  }
}