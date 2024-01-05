import 'package:flutter/material.dart';

import 'package:tetiharana/utilities/helper.dart';
import 'package:tetiharana/widget/navigation/app_bar.dart';
import 'package:tetiharana/widget/button/button.dart';
import 'package:tetiharana/widget/navigation/drawer.dart';
import 'package:tetiharana/widget/image/background_image.dart';
import 'package:tetiharana/widget/input/image_picker.dart';
import 'package:tetiharana/utilities/tools.dart';
import 'package:tetiharana/widget/panel/expansion_panel.dart';

enum SexeChoice { male, female }

class UserUpdateView extends StatefulWidget {
  final int uid;
  const UserUpdateView({
    super.key,
    required this.uid,
  });

  @override
  State<UserUpdateView> createState() => _UserUpdateViewState();
}

class _UserUpdateViewState extends State<UserUpdateView> {
  Helper helper = Helper();

  String profile = "";
  String initial = "";

  @override
  Widget build(BuildContext context) {
    clear() {}

    onSubmit() {}

    // *************** Info perso ***************
    TextEditingController firstnameController = TextEditingController();
    TextEditingController lastnameController = TextEditingController();
    TextEditingController sexeController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController contactController = TextEditingController();
    TextEditingController birthdayController = TextEditingController();
    TextEditingController deathdayController = TextEditingController();

    List<UserInfoItem> infoPerso = [
      UserInfoItem(
        title: "Nom(s):",
        controller: firstnameController,
      ),
      UserInfoItem(
        title: "Prénom(s):",
        controller: lastnameController,
      ),
      UserInfoItem(
        title: "Sexe:",
        controller: sexeController,
      ),
      UserInfoItem(
        title: "Email:",
        controller: emailController,
      ),
      UserInfoItem(
        title: "Contact:",
        controller: contactController,
      ),
      UserInfoItem(
        title: "Date de naissance:",
        controller: birthdayController,
      ),
      UserInfoItem(
        title: "Date de décès:",
        controller: deathdayController,
      ),
    ];
    // *************** End Info perso ***************

    // *************** parents info ***************
    TextEditingController fathernameController = TextEditingController();
    TextEditingController mothernameController = TextEditingController();

    List<UserInfoItem> parents = [
      UserInfoItem(
        title: "Nom du père:",
        controller: fathernameController,
        readOnly: true,
      ),
      UserInfoItem(
        title: "Nom de la mère:",
        controller: mothernameController,
        readOnly: true,
      ),
    ];
    // *************** End parents info ***************

    // *************** Marital status info ***************
    TextEditingController spouseController = TextEditingController();
    TextEditingController childrenController = TextEditingController();

    List<UserInfoItem> maritalStatus = [
      UserInfoItem(
        title: "Epoux(se) de:",
        controller: spouseController,
        readOnly: true,
      ),
      UserInfoItem(
        title: "Nombres d'enfants:",
        controller: childrenController,
        readOnly: true,
      ),
    ];
    // *************** End Marital status info ***************

    // *************** Children info ***************
    List<ChildrenItem> children = [
      ChildrenItem(
        profile: "",
        firstname: "RAKOTOVOLOLONA",
        lastname: "Tsiverisoa Rojotiana",
        age: helper.ageCalculator("1990-02-14"),
      ),
    ];
    // *************** End children info ***************

    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(58.0),
          child: MyAppBar(
            title: 'Modifier les informations',
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
                          // const CircleAvatar(
                          //   radius: 70,
                          //   backgroundColor: Tools.color06,
                          //   backgroundImage: AssetImage(
                          //     'assets/images/icon/icon_user.png',
                          //   ),
                          // ),
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

                  // --------------------- Details ---------------------
                  MyExpansionPanel(
                    title: "Informations personnelles",
                    children: infoPerso,
                  ),
                  MyExpansionPanel(
                    title: "Parents",
                    children: parents,
                  ),
                  MyExpansionPanel(
                    title: "Situation matrimoniale",
                    children: maritalStatus,
                  ),
                  MyExpansionPanel(
                    title: "Enfants",
                    children: children,
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

class UserInfoItem extends StatefulWidget {
  final String title;
  final TextEditingController? controller;
  final bool readOnly;

  const UserInfoItem({
    super.key,
    required this.title,
    this.controller,
    this.readOnly = false,
  });

  @override
  State<UserInfoItem> createState() => _UserInfoItemState();
}

class _UserInfoItemState extends State<UserInfoItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              widget.title,
              style: const TextStyle(
                color: Tools.color06,
                fontWeight: Tools.fontWeight01,
              ),
            ),
          ),
          Flexible(
            child: TextField(
              controller: widget.controller,
              readOnly: widget.readOnly,
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                color: Tools.color02,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChildrenItem extends StatefulWidget {
  final String profile;
  final String firstname;
  final String lastname;
  final int age;

  const ChildrenItem({
    super.key,
    required this.profile,
    required this.firstname,
    required this.lastname,
    required this.age,
  });

  @override
  State<ChildrenItem> createState() => _ChildrenItemState();
}

class _ChildrenItemState extends State<ChildrenItem> {
  Helper helper = Helper();

  @override
  Widget build(BuildContext context) {
    String initial = helper.getInitial(widget.firstname, widget.lastname);

    return Padding(
      padding: const EdgeInsets.only(
        top: 5,
        bottom: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              widget.profile != ""
                  ? CircleAvatar(
                      radius: 20,
                      backgroundColor: Tools.color02,
                      backgroundImage: AssetImage(
                        widget.profile,
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 40,
                        height: 40,
                        color: Tools.color02,
                        padding: const EdgeInsets.all(8),
                        child: Center(
                          child: Text(
                            initial,
                            style: const TextStyle(
                              fontWeight: Tools.fontWeight01,
                              color: Tools.color05,
                            ),
                          ),
                        ),
                      ),
                    ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.firstname,
                    style: const TextStyle(
                      color: Tools.color06,
                      fontWeight: Tools.fontWeight01,
                    ),
                  ),
                  Text(
                    widget.lastname,
                    style: const TextStyle(
                      color: Tools.color06,
                      fontWeight: Tools.fontWeight01,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            "${widget.age} ans",
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Tools.color02,
            ),
          ),
        ],
      ),
    );
  }
}
