import 'package:flutter/material.dart';
import 'package:wild_movies_flutter/gui/app_style.dart';
import 'package:wild_movies_flutter/gui/widgets/primary_button_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({ Key? key }) : super( key: key );

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: media.height * 1,
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
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: true,
                            style: const TextStyle(
                              color: AppStyle.whiteColor
                            ),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              hintText: 'Correo',
                              border: InputBorder.none,
                              hintStyle: const TextStyle(
                                color: AppStyle.greyColor
                              ),
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
                          const SizedBox(height: 20.0),
                          TextFormField(
                            // controller: emailController,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.emailAddress,
                            obscureText: _passwordVisible,
                            autocorrect: false,
                            style: const TextStyle(
                              color: AppStyle.whiteColor
                            ),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                                ),
                                color: AppStyle.greyColor,
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              hintText: 'Contraseña',
                              border: InputBorder.none,
                              hintStyle: const TextStyle(
                                color: AppStyle.greyColor
                              ),
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
      ),
    );
  }
}