import 'package:flutter/material.dart';

import 'package:tetiharana/widget/navigation/app_bar.dart';
import 'package:tetiharana/widget/button/button.dart';
import 'package:tetiharana/widget/input/date_picker.dart';
import 'package:tetiharana/widget/navigation/drawer.dart';
import 'package:tetiharana/widget/image/background_image.dart';
import 'package:tetiharana/widget/input/image_picker.dart';
import 'package:tetiharana/widget/input/text_input.dart';
import 'package:tetiharana/utilities/tools.dart';

enum SexeChoice { male, female }

class MemberAdd extends StatefulWidget {
  const MemberAdd({super.key});

  @override
  State<MemberAdd> createState() => _MemberAddState();
}

class _MemberAddState extends State<MemberAdd> {
  SexeChoice? _sexe = SexeChoice.male;
  IconData _sexeIcon = Icons.male_rounded;

  // -------------- input controller --------------
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  String sexeController = 'male';
  var emailController = TextEditingController();
  String birthdateController = "";
  String deathdateController = "";

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;

    onSubmit() {}

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
                              const ImagePicker(
                                title: "Profile",
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
