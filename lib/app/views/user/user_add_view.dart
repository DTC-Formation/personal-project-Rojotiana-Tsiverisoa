import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:tetiharana/app/controller/user_controller.dart';
import 'package:tetiharana/app/services/auth_services.dart';
import 'package:tetiharana/utilities/constants.dart';
import 'package:tetiharana/utilities/helper.dart';
import 'package:tetiharana/widget/dialog/dialog.dart';
import 'package:tetiharana/widget/input/dropdown.dart';
import 'package:tetiharana/widget/navigation/app_bar.dart';
import 'package:tetiharana/widget/button/button.dart';
import 'package:tetiharana/widget/input/date_picker.dart';
import 'package:tetiharana/widget/navigation/drawer.dart';
import 'package:tetiharana/widget/image/background_image.dart';
import 'package:tetiharana/widget/input/image_picker.dart';
import 'package:tetiharana/widget/input/text_input.dart';
import 'package:tetiharana/utilities/tools.dart';

enum SexeChoice { male, female }

class UserAddView extends StatefulWidget {
  const UserAddView({super.key});

  @override
  State<UserAddView> createState() => _MemberAddState();
}

class _MemberAddState extends State<UserAddView> {
  MyDialog myDialog = MyDialog();
  Helper helper = Helper();

  SexeChoice? _sexe = SexeChoice.male;
  IconData _sexeIcon = Icons.male_rounded;

  // -------------- input controller --------------
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  String sexeController = 'male';
  TextEditingController emailController = TextEditingController();
  String birthdateController = "";
  String deathdateController = "";
  String ruleController = "";
  String maritalStatusController = "";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

// ***************** Create new user *****************
    UserController userController = UserController();

    onAddingSuccess() {
      myDialog.showMyDialog(
        title: "Félicitation",
        description: "La personne a bien été ajoutée!",
        confirmAction: () => {Navigator.of(context).pop()},
        confirmTitle: "Ok",
        context: context,
      );
    }

    onAddingFail(error) {
      myDialog.showMyDialog(
        title: "Erreur",
        description: "$error",
        confirmAction: () => {Navigator.of(context).pop()},
        confirmTitle: "Ok",
        context: context,
      );
    }

    Future<void> onSubmit() async {
      Dio dio = Dio();
      AuthServices auth = AuthServices();
      // const apiUrl = "http://localhost:8000/api";
      String apiUrl = "${Constant.apiUrl}/api";
      var token = await auth.getToken();
      // dio.options.baseUrl = apiUrl;
      dio.options.headers['Authorization'] = "Bearer $token";
      // dio.options.contentType = Headers.formUrlEncodedContentType;
      dio.options.headers['Content-type'] = 'application/json; charset=UTF-8';
      final data = {
        "firstname": firstnameController.text,
        "lastname": lastnameController.text,
        "sexe": sexeController,
        "email": emailController.text,
        "birthday": helper.formatDate(birthdateController),
        "deathday": helper.formatDate(deathdateController),
        "rule": ruleController,
        "marital_status": maritalStatusController,
      };
      try {
        final response = await dio.post("$apiUrl/user", data: data);
        print(response);
        onAddingFail(response);
        // return response.data;
      } catch (e) {
        print(e);
      }
      // final response = await http.post(Uri.https(apiUrl, 'user'), body: data);
      // print(response);
    }

    // onSubmit() async {
    //   var data = {
    //     "firstname": firstnameController.text,
    //     "lastname": lastnameController.text,
    //     "sexe": sexeController,
    //     "email": emailController.text,
    //     "birthdate": helper.formatDate(birthdateController),
    //     "deathdate": helper.formatDate(deathdateController),
    //     "rule": ruleController,
    //     "marital_status": maritalStatusController,
    //   };
    //   try {
    //     await userController.createUser(data, onAddingSuccess, onAddingFail);
    //   } catch (error) {
    //     print("Error creating user: $error");
    //   }
    //   // print(data);
    // }

    clear() {
      setState(() {
        firstnameController.clear();
        lastnameController.clear();
        _sexe = SexeChoice.male;
        sexeController = 'male';
        emailController.clear();
        birthdateController = "";
        deathdateController = "";
      });
    }

    customTitle(String title) {
      return Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Center(
          child: Container(
            color: Tools.color05,
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
            ),
            child: Text(
              title,
              style: const TextStyle(
                color: Tools.color02,
                fontSize: Tools.fontSize02,
                backgroundColor: Tools.color05,
              ),
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(58.0),
          child: MyAppBar(
            title: 'Adhésion / Membres',
          ),
        ),
        drawer: const MyDrawer(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --------------------- Image ---------------------
                  const MyBackgroundImage(
                    source: "assets/images/background/bg_3.webp",
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  // --------------------- Info perso ---------------------
                  Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: size.width,
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Tools.color09,
                              ),
                              borderRadius: BorderRadius.circular(
                                Tools.radius01,
                              ),
                            ),
                            width: size.width,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                20,
                                10,
                                20,
                                20,
                              ),
                              child: Column(
                                children: [
                                  MyTextInput(
                                    inputController: firstnameController,
                                    labelText: "Nom(s)",
                                    icon: Icons.person,
                                  ),
                                  MyTextInput(
                                    inputController: lastnameController,
                                    labelText: "prénom(s)",
                                    icon: Icons.person,
                                  ),
                                  Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Flexible(
                                            child: Text(
                                              'Sexe',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Tools.color10,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Icon(
                                              _sexeIcon,
                                              color: Tools.color09,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            child: RadioListTile<SexeChoice>(
                                              activeColor: Tools.color08,
                                              title: const Text(
                                                'Homme',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Tools.color10,
                                                ),
                                              ),
                                              value: SexeChoice.male,
                                              groupValue: _sexe,
                                              onChanged: (SexeChoice? value) {
                                                setState(() {
                                                  _sexe = value;
                                                  _sexeIcon =
                                                      Icons.male_rounded;
                                                  sexeController = 'male';
                                                });
                                              },
                                            ),
                                          ),
                                          Flexible(
                                            child: RadioListTile<SexeChoice>(
                                              activeColor: Tools.color08,
                                              title: const Text(
                                                'Femme',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Tools.color10,
                                                ),
                                              ),
                                              value: SexeChoice.female,
                                              groupValue: _sexe,
                                              onChanged: (SexeChoice? value) {
                                                setState(() {
                                                  _sexe = value;
                                                  _sexeIcon =
                                                      Icons.female_rounded;
                                                  sexeController = 'female';
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(
                                        color: Tools.color09,
                                      ),
                                    ],
                                  ),
                                  MyTextInput(
                                    inputController: emailController,
                                    labelText: "Email",
                                    icon: Icons.mail_outline,
                                  ),
                                  MyDatePicker(
                                    title: "Date de naissance",
                                    controller: birthdateController,
                                    updateDate: (String newValue) {
                                      setState(() {
                                        birthdateController = newValue;
                                      });
                                    },
                                  ),
                                  MyDatePicker(
                                    title: "Date de décès",
                                    controller: deathdateController,
                                    updateDate: (String newValue) {
                                      setState(() {
                                        deathdateController = newValue;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      customTitle('Informations personnelles'),
                    ],
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  // --------------------- Info supp ---------------------
                  Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: size.width,
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Tools.color09,
                              ),
                              borderRadius: BorderRadius.circular(
                                Tools.radius01,
                              ),
                            ),
                            width: size.width,
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 20),
                              child: Column(
                                children: [
                                  MyDropdown(
                                    items: [
                                      DropdownItem(
                                        list: "Visiteur",
                                        value: "viewer",
                                      ),
                                      DropdownItem(
                                        list: "Administrateur",
                                        value: "admin",
                                      ),
                                    ],
                                    onChanged: (newValue) {
                                      setState(() {
                                        ruleController = newValue;
                                      });
                                    },
                                    hintText: 'Rôle',
                                    controller: ruleController,
                                  ),
                                  MyDropdown(
                                    items: [
                                      DropdownItem(
                                        list: "Célibataire",
                                        value: "single",
                                      ),
                                      DropdownItem(
                                        list: "Marié(e)",
                                        value: "married",
                                      ),
                                      DropdownItem(
                                        list: "Divorcé(e)",
                                        value: "divorced",
                                      ),
                                    ],
                                    onChanged: (newValue) {
                                      setState(() {
                                        maritalStatusController = newValue;
                                      });
                                    },
                                    hintText: 'Situation matrimoniale',
                                    controller: maritalStatusController,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      customTitle('Informations supplémentaires'),
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  // --------------------- Button ---------------------
                  Row(
                    children: [
                      Flexible(
                        child: MyButton(
                          title: 'Annuler',
                          action: clear,
                          textColor: Tools.color08,
                          backgroundColor: Colors.transparent,
                          borderColor: Tools.color08,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: MyButton(
                          title: 'Enregistrer',
                          action: onSubmit,
                          textColor: Tools.color05,
                          backgroundColor: Tools.color08,
                          borderColor: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ImagePicker extends StatefulWidget {
  final String title;

  const ImagePicker({
    super.key,
    required this.title,
  });

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  String filename = "";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              filename != ""
                  ? Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Tools.color09,
                      ),
                    )
                  : Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 0,
                        color: Tools.color09,
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Tools.color10,
                      ),
                    ),
                  ),
                  child: SizedBox(
                    width: size.width,
                    height: 50,
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Text(
                          filename != "" ? filename : widget.title,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const Positioned(
                          right: -2,
                          child: MyImagePicker(
                            icon: Icons.image_rounded,
                            iconColor: Tools.color09,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
