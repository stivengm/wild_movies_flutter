import 'package:flutter/material.dart';
import 'package:wild_movies_flutter/gui/app_style.dart';

class SearchView extends StatelessWidget {
  const SearchView({ Key? key }) : super( key: key );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        // controller: emailController,
        // textInputAction: TextInputAction.next,
        // keyboardType: TextInputType.emailAddress,
        autocorrect: false,
        style: const TextStyle(
          color: AppStyle.whiteColor
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: 'Película...',
          border: InputBorder.none,
          labelStyle: const TextStyle(
            color: AppStyle.greyColor
          ),
          filled: true,
          fillColor: AppStyle.greyColor.withOpacity(.1),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: AppStyle.transparent),
            borderRadius: BorderRadius.circular(15.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: AppStyle.transparent),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}