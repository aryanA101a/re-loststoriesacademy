import 'package:auth_buttons/res/buttons/facebook_auth_button.dart';
import 'package:auth_buttons/res/buttons/google_auth_button.dart';
import 'package:auth_buttons/res/shared/auth_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loststoriesacademy/Screens/authentication/signup/signup.dart';
import 'package:loststoriesacademy/Screens/bottom_nav_bar/navbar.dart';
import 'package:loststoriesacademy/constants/dimensions.dart';
import 'package:loststoriesacademy/progressHUD.dart';
import 'package:loststoriesacademy/repositories/userExperience.dart';
import 'package:loststoriesacademy/constants/colors.dart';

import 'package:loststoriesacademy/services/LoginServices.dart';
import 'package:loststoriesacademy/widget/widgets.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled() {
    return isPopulated;
  }

  @override
  Widget build(BuildContext context) {
    final userExperience = Provider.of<UserExperience>(context);
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15, right: 20, left: 39),
              child: Row(
                children: [
                  Text(
                    "Login",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: base_purple,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationThickness: 4,
                    ),
                  ),
                  Text(
                    "    SignUp",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  Image.asset(
                    'assets/logo.png',
                    scale: 3,
                  ),
                ],
              ),
            ),
            Container(
                child: Image.asset(
              'assets/cover_image.png',
              scale: 1,
            )),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 39, bottom: 7),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Username/Email',
                          style: GoogleFonts.poppins(fontSize: 16),
                        )),
                    textFormField(context,
                        controller: _emailController,
                        hMargin: 39,
                        radius: 10,
                        vMargin: 7, 
                      
                   suffixIcon: Icon(Icons.check)),
                    Container(
                        margin: EdgeInsets.only(left: 39, bottom: 7),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Password',
                          style: GoogleFonts.poppins(fontSize: 16),
                        )),
                    textFormField(
                      context,
                      controller: _passwordController,
                      hMargin: 39,
                      obscureText: userExperience.isHidden,
                      radius: 10,
                      vMargin: 7,
                  
                      suffixIcon: IconButton(
                          icon: userExperience.isHidden
                              ? Icon(Icons.visibility_rounded)
                              : Icon(Icons.visibility_off_rounded),
                          onPressed: () {
                            userExperience.changeValue();
                          }),
                    ),
                    Container(
                      child: button(
                        context,
                        color: pcolor,
                        text: 'Login',
                        onBtnPress: () {
                          if (_formKey.currentState.validate()) {
                           LoginServices.login(
                                context,
                                _emailController.text,
                                _passwordController.text);
                          }
                        },
                        width: 0.44,
                        vMargin: 20,
                      ),
                    )
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: GoogleAuthButton(
                    borderRadius: 25,
                    onPressed: () {},
                    darkMode: false,
                    style: AuthButtonStyle.icon,
                  ),
                ),
                Text(
                  "or",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: FacebookAuthButton(
                    borderRadius: 25,
                    onPressed: () {},
                    darkMode: false,
                    style: AuthButtonStyle.icon,
                  ),
                )
              ],
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text(
                    'Don\'t have an account? Create one! ',
                    style: GoogleFonts.poppins(color: base_purple),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();

    super.dispose();
  }
}
