import 'package:flutter/material.dart';

import 'package:tetiharana/app/controller/familly_controller.dart';
import 'package:tetiharana/app/controller/user_controller.dart';
import 'package:tetiharana/utilities/helper.dart';
import 'package:tetiharana/widget/dialog/dialog.dart';
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
  MyDialog myDialog = MyDialog();
  UserController userController = UserController();
  FamillyController famillyController = FamillyController();

  String profile = "";
  String initial = "";
  bool isLoading = false;
  String filePath = "";
  String lastnamePart = "";
  String name = "";
  List<dynamic> fatherName = [];
  List<dynamic> motherName = [];
  List<dynamic> spouseName = [];

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController sexeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  // TextEditingController contactController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController deathdayController = TextEditingController();

  TextEditingController childrenController = TextEditingController();

  // ********************** Load user info **********************
  List<ChildrenItem> childrenInfoList = [];

  loadUserInfo() async {
    setState(() {
      isLoading = true;
    });

    await userController.getUserById(
      id: widget.uid,
      onSuccess: onLoadSuccess,
      onError: onLoadFail,
    );
  }

  onLoadSuccess(userData) {
    filePath = helper.getFilePath("profile");
    String sexe = "";
    String birthday = "";
    String deathday = "";
    String filename = "";

    setState(() {
      // --------------------- Info perso ---------------------
      initial = helper.getInitial(
        "${userData['firstname']}",
        "${userData['lastname']}",
      );
      firstnameController.text = userData['firstname'] ?? '';
      lastnameController.text = userData['lastname'] ?? '';
      lastnamePart = helper.getNamePart(lastnameController.text);
      name = "${firstnameController.text} $lastnamePart";

      sexe = userData['sexe'] ?? '';
      sexeController.text = helper.getSexe(sexe: sexe);

      emailController.text = userData['email'] ?? '';
      // contactController.text = userData['contact'] ?? '';

      birthday = userData['birthday'] ?? '';
      birthdayController.text = helper.formatDateString(birthday);

      deathday = userData['deathday'] ?? '';
      deathdayController.text =
          deathday.isNotEmpty ? helper.formatDateString(deathday) : '';

      filename = userData['filename'] ?? '';
      profile = filename.isNotEmpty ? "$filePath/$filename" : "";

      // --------------------- Parents info ---------------------
      if (userData['parent_info'] != null) {
        var father = userData['parent_info']['father'] ?? [];
        var mother = userData['parent_info']['mother'] ?? [];

        if (father != null) {
          var fatherInfoData = father['father_id'] ?? [];
          var fatherNameData = father['father_name'] ?? [];

          if (fatherInfoData is Map) {
            fatherName.add(
                "${fatherInfoData['firstname']} ${fatherInfoData['lastname']}");
          } else {
            for (var item in fatherInfoData) {
              fatherName.add("${item['firstname']} ${item['lastname']}");
            }
          }

          for (int i = 0; i < fatherNameData.length; i++) {
            fatherName.add(fatherNameData[i]);
          }
        }

        if (mother.isNotEmpty) {
          var motherInfoData = mother['mother_id'] ?? [];
          var motherNameData = mother['mother_name'] ?? [];
          if (motherInfoData is Map) {
            motherName.add(
                "${motherInfoData['firstname']} ${motherInfoData['lastname']}");
          } else {
            for (var item in motherInfoData) {
              motherName.add("${item['firstname']} ${item['lastname']}");
            }
          }

          for (int i = 0; i < motherNameData.length; i++) {
            motherName.add("${motherNameData[i]}");
          }
        }
      }

      // -------------------- Martial status --------------------
      if (userData['spouse_info'] != null) {
        var spouseInfoData = userData['spouse_info']['spouse_id'] ?? [];
        var spouseNameData = userData['spouse_info']['spouse_name'] ?? [];

        if (spouseInfoData is Map) {
          spouseName.add(
              "${spouseInfoData['firstname']} ${spouseInfoData['lastname']}");
        } else {
          for (var item in spouseInfoData) {
            spouseName.add("${item['firstname']} ${item['lastname']}");
          }
        }

        for (int i = 0; i < spouseNameData.length; i++) {
          spouseName.add("${spouseNameData[i]}");
        }
      }
      String jsonData = userData['children'] ?? '';

      int numberOfChild = famillyController.getChildNumber(
        data: jsonData,
      );
      childrenController.text = numberOfChild.toString();

      // --------------------- Children info --------------------
      if (userData['children_info'] != null) {
        var childrenInfoData = userData['children_info']['children_id'] ?? [];
        var childrenNameData = userData['children_info']['children_name'] ?? [];

        if (childrenInfoData is Map) {
          birthday = childrenInfoData['birthday'] ?? "";

          childrenInfoList.add(
            ChildrenItem(
              profile: childrenInfoData['filename'] ?? "",
              firstname: '${childrenInfoData['firstname']}',
              lastname: '${childrenInfoData['lastname']}',
              age: helper.ageCalculator(birthday),
            ),
          );
        } else {
          for (var item in childrenInfoData) {
            birthday = item['birthday'] ?? "";

            childrenInfoList.add(
              ChildrenItem(
                profile: item['filename'] ?? "",
                firstname: '${item['firstname']}',
                lastname: '${item['lastname']}',
                age: helper.ageCalculator(birthday),
              ),
            );
          }
        }

        for (int i = 0; i < childrenNameData.length; i++) {
          childrenInfoList.add(
            ChildrenItem(
              profile: '',
              firstname: '${childrenNameData[i]}',
              lastname: '',
              age: 0,
            ),
          );
        }
      }

      isLoading = false;
    });
  }

  onLoadFail(error) {
    debugPrint("Error loading user info: $error");
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadUserInfo();
  }
// ***************** Ending to load user info *****************

  @override
  Widget build(BuildContext context) {
    // *************** Info perso ***************
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
      if (emailController.text.isNotEmpty)
        UserInfoItem(
          title: "Email:",
          controller: emailController,
          readOnly: true,
        ),
      // if (contactController.text.isNotEmpty)
      //   UserInfoItem(
      //     title: "Contact:",
      //     controller: contactController,
      //     readOnly: true,
      //   ),
      UserInfoItem(
        title: "Date de naissance:",
        controller: birthdayController,
        readOnly: true,
      ),
      if (deathdayController.text.isNotEmpty)
        UserInfoItem(
          title: "Date de décès:",
          controller: deathdayController,
          readOnly: true,
        ),
    ];
    // *************** End Info perso ***************

    // *************** parents info ***************
    List<ExtraInfoItem> parents = [
      if (fatherName.isNotEmpty)
        ExtraInfoItem(
          title: "Nom du père:",
          name: fatherName,
        ),
      if (motherName.isNotEmpty)
        ExtraInfoItem(
          title: "Nom de la mère:",
          name: motherName,
        ),
    ];
    // *************** End parents info ***************

    // *************** Marital status info ***************
    List<ExtraInfoItem> maritalStatus = [
      if (spouseName.isNotEmpty)
        ExtraInfoItem(
          title: "Epoux(se):",
          name: spouseName,
        ),
    ];
    // *************** End Marital status info ***************

    // *************** Children info ***************
    List<ChildrenItem> children = [];
    children.addAll(childrenInfoList);
    // *************** End children info ***************

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(58.0),
          child: MyAppBar(
            title: 'A propos de $name',
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
                                  backgroundImage: NetworkImage(
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
                  if (fatherName.isNotEmpty || motherName.isNotEmpty)
                    MyExpansionPanel(
                      title: "Parents",
                      children: parents,
                    ),
                  if (maritalStatus.isNotEmpty ||
                      childrenController.text != "0")
                    MyExpansionPanel(
                      title: "Situation matrimoniale",
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: maritalStatus,
                        ),
                        UserInfoItem(
                          title: "Nombres d'enfants:",
                          controller: childrenController,
                          readOnly: true,
                        )
                      ],
                    ),
                  if (children.isNotEmpty)
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
    String filePath = helper.getFilePath("profile");

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
              widget.profile.isNotEmpty
                  ? CircleAvatar(
                      radius: 20,
                      backgroundColor: Tools.color02,
                      backgroundImage: NetworkImage(
                        "$filePath/${widget.profile}",
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
                  if (widget.lastname.isNotEmpty)
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
          if (widget.age != 0)
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

class ExtraInfoItem extends StatefulWidget {
  final String title;
  final List<dynamic> name;
  final bool readOnly;

  const ExtraInfoItem({
    super.key,
    required this.title,
    required this.name,
    this.readOnly = false,
  });

  @override
  State<ExtraInfoItem> createState() => _ExtraInfoItemState();
}

class _ExtraInfoItemState extends State<ExtraInfoItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 8,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              color: Tools.color06,
              fontWeight: Tools.fontWeight01,
            ),
          ),
          for (String name in widget.name)
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 3,
              ),
              child: Text(
                "- $name",
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
