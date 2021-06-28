import 'dart:io';
import 'package:loststoriesacademy/Screens/bottom_nav_bar/navbar_provider.dart';

import 'package:flutter/material.dart';
import 'package:loststoriesacademy/Screens/profile_page/Profile.dart';
import 'package:loststoriesacademy/models/Userdata.dart';

import 'package:loststoriesacademy/services/userdataservices.dart';
import 'package:loststoriesacademy/widget/widgets.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  final name;
  final username;
  final imageUrl;
  EditProfile({this.name, this.username, this.imageUrl});
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String url;
  String name = '';
  String username = '';
  UserData userData;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ScrollController scrollController = ScrollController();
  final TextEditingController usernaemCon = TextEditingController();
  final TextEditingController nameCon = TextEditingController();
  bool isLoading = false;

  saveUpdatedData(navData) {
    if (_formKey.currentState.validate()) {

      //     .updateData(name != '' ? name : widget.name,
      //         username != '' ? username : widget.username)
      //     .then((value) => Navigator.pop(context));
    }
  }

  updateProfileImage() {
    setState(() {
      isLoading = true;
    });
    // userRepository.selectImageFromDevice().then((value) async {
    //   print(value.path);
    //   if (value != null) {
    //     await userRepository
    //         .uploadImageToFirebase(File(value.path))
    //         .then((value) async {
    //       Navigator.pushReplacement(
    //           context,
    //           MaterialPageRoute(
    //             builder: (context) => Profile(),
    //           ));
    //       print(value);
    //     });
    //   }
    // });
  }

  Future editData() async {
    await UserDataServices.editData(context ,usernaemCon.text, nameCon.text)
        .then((value) {
      userData = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var navProvider = Provider.of<NavbarProvider>(context);

    url = widget.imageUrl;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Scrollbar(
        isAlwaysShown: true,
        thickness: 5,
        controller: scrollController,
        child: SingleChildScrollView(
          controller: scrollController,
          child: isLoading
              ? Center(
                  child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: CircularProgressIndicator(),
                ))
              : Container(
                  // width: 170,
                  margin: EdgeInsets.symmetric(vertical: 12),
                  // height: MediaQuery.of(context).size.height * .5,
                  // width: MediaQuery.of(context).size.width * .5,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                           // updateProfileImage();
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 15),
                            // height: 160.0,
                            // width: 160.0,
                            child: CircleAvatar(
                              radius: 80,
                              backgroundImage: widget.imageUrl != null
                                  ? NetworkImage(url)
                                  : AssetImage(
                                      'assets/profile_placeholder.png'),
                            ),
                          ),
                        ),
                        textFormField(
                          context,
                          onChanged: (val) {
                            name = val;
                          },
                          validator: (val) =>
                              val.isEmpty ? "Enter Your Name" : null,
                          hMargin: 30,
                          hintText: 'Name',
                          initialValue: widget.name,
                        ),
                        textFormField(context,
                            onChanged: (val) {
                              username = val;
                            },
                            hMargin: 30,
                            validator: (val) =>
                                val.isEmpty ? "Enter Your Username" : null,
                            hintText: 'Username',
                            initialValue: widget.username),
                        button(
                          context, 
                          text: 'Save', 
                          onBtnPress: () {
                          UserDataServices.editData(
                            context,
                              usernaemCon.text,
                               nameCon.text);
                              
                       
                        }, hMargin: 60, vMargin: 10),
                      ],
                    ),
                  )),
        ),
      ),
    );
  }
}
