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

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  SexeChoice? _sexe = SexeChoice.male;
  IconData _sexeIcon = Icons.male_rounded;

  // -------------- input controller --------------
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  String sexeController = 'male';
  var emailController = TextEditingController();
  String birthdateController = "";
  String deathdateController = "";
  String maritalStatusController = "";

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;

    onSubmit() {}

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
                          const CircleAvatar(
                            radius: 70,
                            backgroundColor: Tools.color06,
                            backgroundImage: AssetImage(
                              'assets/images/icon/icon_user.png',
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
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Center(
                      child: Text(
                        'Informations personnelles',
                        style: TextStyle(
                          color: Tools.color02,
                          fontSize: Tools.fontSize02,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Tools.color10,
                          ),
                          borderRadius: BorderRadius.circular(
                            Tools.radius01,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                              _sexeIcon = Icons.male_rounded;
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
                                              _sexeIcon = Icons.female_rounded;
                                              sexeController = 'female';
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    color: Tools.color10,
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
                              MyDropdown(
                                items: [
                                  DropdownItem(list: "one", value: "1"),
                                  DropdownItem(list: "two", value: "2"),
                                  DropdownItem(list: "three", value: "3"),
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
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // MyDropdown(
                  //   items: [
                  //     DropdownItem(list: "one", value: "1"),
                  //     DropdownItem(list: "two", value: "2"),
                  //     DropdownItem(list: "three", value: "3"),
                  //   ],
                  //   onChanged: (selectedValue) {
                  //     print('Selected Value: $selectedValue');
                  //   },
                  //   hintText: 'rojo',
                  // ),
                  // --------------------- Button ---------------------
                  Row(
                    children: [
                      Flexible(
                        child: MyButton(
                          title: 'Annuler',
                          action: () => {},
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
