import 'package:flutter/material.dart';

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

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  SexeChoice? _sexe = SexeChoice.male;
  IconData _sexeIcon = Icons.male_rounded;

  // -------------- input controller --------------
  String profile = "";
  String initial = "RR";
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  String sexeController = 'male';
  TextEditingController emailController = TextEditingController();
  String birthdateController = "";
  String deathdateController = "";
  String maritalStatusController = "";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    onSubmit() {
      // var data = {
      //   "firstname": firstnameController.text,
      //   "lastname": lastnameController.text,
      //   "sexe": sexeController,
      //   "email": emailController.text,
      //   "birthdate": birthdateController,
      //   "deathdate": deathdateController,
      //   "marital_status": maritalStatusController,
      // };

      // print(data);
    }

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
            title: 'Profil utilisateur',
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
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const MyBackgroundImage(
                        source: "assets/images/background/bg_2.webp",
                      ),
                      Stack(
                        children: [
                          profile != ""
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(70),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      boxShadow: [Tools.shadow02],
                                    ),
                                    child: CircleAvatar(
                                      radius: 70,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: AssetImage(
                                        profile,
                                      ),
                                    ),
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(70),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      boxShadow: [Tools.shadow02],
                                    ),
                                    width: 140,
                                    height: 140,
                                    child: Center(
                                      child: Text(
                                        initial,
                                        style: const TextStyle(
                                          color: Tools.color05,
                                          fontSize: Tools.fontSize03,
                                          fontWeight: Tools.fontWeight01,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                          Positioned(
                            bottom: 5,
                            right: 13,
                            child: InkWell(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    boxShadow: [
                                      Tools.shadow01,
                                    ],
                                    color: Tools.color05,
                                  ),
                                  padding: const EdgeInsets.all(5),
                                  child: const MyImagePicker(
                                    icon: Icons.photo_camera,
                                    iconColor: Tools.color09,
                                    iconSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
