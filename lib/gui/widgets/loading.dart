import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wild_movies_flutter/gui/app_style.dart';

class Loading extends StatelessWidget {
  const Loading({ Key? key }) : super( key: key );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS ? _loadingIOS() : _loadAndroid(),
    );
  }

  Widget _loadingIOS() {
    return const CupertinoActivityIndicator(
      radius: 16.0,
      color: AppStyle.whiteColor,
    );
  }

  Widget _loadAndroid() {
    return const CircularProgressIndicator(
      color: AppStyle.whiteColor,
    );
  }

}