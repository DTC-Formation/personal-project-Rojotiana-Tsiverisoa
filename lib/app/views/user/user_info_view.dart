import 'package:flutter/material.dart';

import 'package:tetiharana/utilities/helper.dart';
import 'package:tetiharana/widget/navigation/app_bar.dart';
import 'package:tetiharana/widget/navigation/drawer.dart';
import 'package:tetiharana/widget/image/background_image.dart';
import 'package:tetiharana/utilities/tools.dart';

class UserInfoView extends StatefulWidget {
  const UserInfoView({super.key});

  @override
  State<UserInfoView> createState() => _UserInfoViewState();
}

class _UserInfoViewState extends State<UserInfoView> {
  Helper helper = Helper();
  String profile = "";
  String initial = "";

  @override
  Widget build(BuildContext context) {
    List<UserInfoItem> infoPerso = [
      const UserInfoItem(
        title: "Nom(s):",
        content: "",
      ),
      const UserInfoItem(
        title: "Prénom(s):",
        content: "",
      ),
      const UserInfoItem(
        title: "Sexe:",
        content: "",
      ),
      const UserInfoItem(
        title: "Email:",
        content: "",
      ),
      const UserInfoItem(
        title: "Contact:",
        content: "",
      ),
      const UserInfoItem(
        title: "Date de naissance:",
        content: "",
      ),
      const UserInfoItem(
        title: "Date de décès:",
        content: "",
      ),
    ];

    List<UserInfoItem> parents = [
      const UserInfoItem(
        title: "Nom du père:",
        content: "",
      ),
      const UserInfoItem(
        title: "Nom de la mère:",
        content: "",
      ),
    ];

    List<UserInfoItem> maritalStatus = [
      const UserInfoItem(
        title: "Epoux(se) de:",
        content: "",
      ),
      const UserInfoItem(
        title: "Nombres d'enfants:",
        content: "",
      ),
    ];

    List<ChildrenItem> children = [
      ChildrenItem(
        profile: "",
        firstname: "RAKOTOVOLOLONA",
        lastname: "Tsiverisoa Rojotiana",
        age: helper.ageCalculator("1990-02-14"),
      ),
    ];

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
                  Column(children: infoPerso),
                  Column(children: parents),
                  Column(children: maritalStatus),
                  Column(children: children),
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
  final String? content;

  const UserInfoItem({
    super.key,
    required this.title,
    this.content,
  });

  @override
  State<UserInfoItem> createState() => _UserInfoItemState();
}

class _UserInfoItemState extends State<UserInfoItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5,
        bottom: 5,
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
            child: Text(
              "${widget.content}",
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Tools.color02,
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
          Flexible(
            child: Row(
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
          ),
          Flexible(
            child: Text(
              "${widget.age} ans",
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Tools.color02,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
