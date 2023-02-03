import 'package:flutter/material.dart';
import 'package:wild_movies_flutter/gui/app_style.dart';
import 'package:wild_movies_flutter/gui/widgets/primary_button_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({ Key? key }) : super( key: key );

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/theWitcher.jpg'),
            fit: BoxFit.cover,
            alignment: Alignment.center
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Text("Bienvenido!", style: Theme.of(context).textTheme.headline6!.copyWith( color: AppStyle.whiteColor ),),
            const SizedBox(),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.8),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)
                )
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
              height: media.height * .5,
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        TextFormField(
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

                      ],
                    ),
                  ),
                  SizedBox(
                    width: media.width * .5,
                    child: PrimaryButton(text: 'Login', color: AppStyle.backgroundColor, onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil('home', (route) => false))
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}