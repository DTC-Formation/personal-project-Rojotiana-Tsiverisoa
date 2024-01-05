import 'package:flutter/material.dart';

import 'package:tetiharana/utilities/helper.dart';
import 'package:tetiharana/widget/navigation/app_bar.dart';
import 'package:tetiharana/widget/navigation/drawer.dart';
import 'package:tetiharana/widget/image/background_image.dart';
import 'package:tetiharana/utilities/tools.dart';
import 'package:tetiharana/widget/panel/expansion_panel.dart';

class UserInfoView extends StatefulWidget {
  final int uid;

  const UserInfoView({
    super.key,
    required this.uid,
  });

  @override
  State<UserInfoView> createState() => _UserInfoViewState();
}

class _UserInfoViewState extends State<UserInfoView> {
  Helper helper = Helper();
  String profile = "";
  String initial = "";

  @override
  Widget build(BuildContext context) {
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
        readOnly: true,
      ),
      UserInfoItem(
        title: "Prénom(s):",
        controller: lastnameController,
        readOnly: true,
      ),
      UserInfoItem(
        title: "Sexe:",
        controller: sexeController,
        readOnly: true,
      ),
      UserInfoItem(
        title: "Email:",
        controller: emailController,
        readOnly: true,
      ),
      UserInfoItem(
        title: "Contact:",
        controller: contactController,
        readOnly: true,
      ),
      UserInfoItem(
        title: "Date de naissance:",
        controller: birthdayController,
        readOnly: true,
      ),
      UserInfoItem(
        title: "Date de décès:",
        controller: deathdayController,
        readOnly: true,
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
            title: 'A propos de utilisateur',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class UserInfoItem extends StatefulWidget {
//   final String title;
//   final String? content;

//   const UserInfoItem({
//     super.key,
//     required this.title,
//     this.content,
//   });

//   @override
//   State<UserInfoItem> createState() => _UserInfoItemState();
// }

// class _UserInfoItemState extends State<UserInfoItem> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(
//         top: 8,
//         bottom: 8,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Flexible(
//             child: Text(
//               widget.title,
//               style: const TextStyle(
//                 color: Tools.color06,
//                 fontWeight: Tools.fontWeight01,
//               ),
//             ),
//           ),
//           Flexible(
//             child: Text(
//               "${widget.content}",
//               textAlign: TextAlign.right,
//               style: const TextStyle(
//                 color: Tools.color02,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ChildrenItem extends StatefulWidget {
//   final String profile;
//   final String firstname;
//   final String lastname;
//   final int age;

//   const ChildrenItem({
//     super.key,
//     required this.profile,
//     required this.firstname,
//     required this.lastname,
//     required this.age,
//   });

//   @override
//   State<ChildrenItem> createState() => _ChildrenItemState();
// }

// class _ChildrenItemState extends State<ChildrenItem> {
//   Helper helper = Helper();

//   @override
//   Widget build(BuildContext context) {
//     String initial = helper.getInitial(widget.firstname, widget.lastname);

//     return Padding(
//       padding: const EdgeInsets.only(
//         top: 5,
//         bottom: 5,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               widget.profile != ""
//                   ? CircleAvatar(
//                       radius: 20,
//                       backgroundColor: Tools.color02,
//                       backgroundImage: AssetImage(
//                         widget.profile,
//                       ),
//                     )
//                   : ClipRRect(
//                       borderRadius: BorderRadius.circular(20),
//                       child: Container(
//                         width: 40,
//                         height: 40,
//                         color: Tools.color02,
//                         padding: const EdgeInsets.all(8),
//                         child: Center(
//                           child: Text(
//                             initial,
//                             style: const TextStyle(
//                               fontWeight: Tools.fontWeight01,
//                               color: Tools.color05,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//               const SizedBox(
//                 width: 10,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     widget.firstname,
//                     style: const TextStyle(
//                       color: Tools.color06,
//                       fontWeight: Tools.fontWeight01,
//                     ),
//                   ),
//                   Text(
//                     widget.lastname,
//                     style: const TextStyle(
//                       color: Tools.color06,
//                       fontWeight: Tools.fontWeight01,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           Text(
//             "${widget.age} ans",
//             textAlign: TextAlign.right,
//             style: const TextStyle(
//               color: Tools.color02,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

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
