import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loststoriesacademy/Screens/authentication/login/login.dart';
import 'package:loststoriesacademy/Screens/bottom_nav_bar/navbar.dart';
import 'package:loststoriesacademy/constants/colors.dart';
import 'package:loststoriesacademy/constants/dimensions.dart';
import 'package:loststoriesacademy/repositories/userExperience.dart';

import 'package:loststoriesacademy/services/SignUpServices.dart';
import 'package:loststoriesacademy/widget/widgets.dart';
import 'package:provider/provider.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool checked = false;

  bool get isPopulated =>
      _emailController.text.isNotEmpty &&
      _passwordController.text.isNotEmpty &&
      _usernameController.text.isNotEmpty &&
      checked;

  bool isSignNextButtonEnabled() {
    return isPopulated;
  }

  bool isSignUpApiCallProcess = false;
  @override
  Widget build(BuildContext context) {
    final userExperience = Provider.of<UserExperience>(context);
    return Scaffold(
      body: Container(
          child: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, right: 20, left: 39),
                  child: Row(
                    children: [
                      Text(
                        "Login    ",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "SignUp",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: base_purple,
                          decorationStyle: TextDecorationStyle.solid,
                          decorationThickness: 4,
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
                Spacer(),
                Container(
                  // margin: EdgeInsets.only(left: 39),
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Welcome,\n',
                          style: GoogleFonts.poppins(fontSize: 30),
                        ),
                        TextSpan(
                            text: 'Create an Account ',
                            style: GoogleFonts.poppins(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Container(
                    margin: EdgeInsets.only(left: 39, bottom: 7),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Username',
                      style: GoogleFonts.poppins(fontSize: 16),
                    )),
                textFormField(context,
                    controller: _usernameController,
                    hMargin: 39,
                    radius: 10,
                    vMargin: 7,
                    suffixIcon: Icon(Icons.check)),
                Container(
                    margin: EdgeInsets.only(left: 39, bottom: 7),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email',
                      style: GoogleFonts.poppins(fontSize: 16),
                    )),
                textFormField(
                  context,
                  controller: _emailController,
                  hMargin: 39,
                  radius: 10,
                  vMargin: 7,
                  suffixIcon: Icon(Icons.check),
                ),
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
                  radius: 10,
                  vMargin: 7,
                  obscureText: userExperience.isHidden,
                  suffixIcon: IconButton(
                        icon: userExperience.isHidden
                              ? Icon(Icons.visibility_rounded)
                              : Icon(Icons.visibility_off_rounded),
                      onPressed: () {
                        userExperience.changeValue();
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25, top: 15),
                  // alignment: Alignment.centerLeft,
                  child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: checked,
                    onChanged: (value) {
                      setState(() {
                        checked = value;
                      });
                    },
                    title: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'I agree to the ',
                            style: GoogleFonts.poppins(fontSize: 11),
                          ),
                          TextSpan(
                              text: 'terms and conditions.',
                              style: GoogleFonts.poppins(
                                  fontSize: 11, color: base_purple)),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: isSignNextButtonEnabled()
                      ? button(context, color: pcolor, text: 'Next',
                          onBtnPress: () {
                          SignUpServices.signUp(
                              context,
                              _usernameController.text,
                              _emailController.text,
                              _passwordController.text);
                        }, width: 0.44, vMargin: 20)
                      : button(context,
                          text: 'Next',
                          color: Colors.grey,
                          onBtnPress: () {},
                          width: 0.44,
                          vMargin: 20),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ));
                    },
                    child: Text(
                      'Already have an account?',
                      style: GoogleFonts.poppins(color: base_purple),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();

    super.dispose();
  }
}
