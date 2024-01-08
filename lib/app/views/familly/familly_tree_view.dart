import 'package:flutter/material.dart';

import 'package:tetiharana/app/controller/user_controller.dart';
import 'package:tetiharana/app/views/user/user_info_view.dart';
import 'package:tetiharana/app/views/user/user_update_view.dart';
import 'package:tetiharana/utilities/helper.dart';
import 'package:tetiharana/utilities/tools.dart';
import 'package:tetiharana/widget/dialog/dialog.dart';
import 'package:tetiharana/widget/loader/loader.dart';
import 'package:tetiharana/widget/navigation/app_bar.dart';
import 'package:tetiharana/widget/navigation/drawer.dart';

class FamillyTreeView extends StatefulWidget {
  final int uid;

  const FamillyTreeView({
    super.key,
    required this.uid,
  });

  @override
  State<FamillyTreeView> createState() => _FamillyTreeViewState();
}

class _FamillyTreeViewState extends State<FamillyTreeView> {
  MyDialog myDialog = MyDialog();
  Helper helper = Helper();
  bool isLoading = false;
  String filePath = "";
  UserController userController = UserController();

  var fatherInfo = {
    "id": 0,
    "initial": "",
    "firstname": "",
    "lastname": "",
    "fullname": "",
    "profile": "",
  };

// ********************** Show menu **********************
  showMenu({
    required int id,
    required String initial,
    required String image,
    required String firstname,
    required String lastname,
  }) {
    // show the bottom sheet & display menu
    return showModalBottomSheet<void>(
      backgroundColor: Tools.color05,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 260,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        image.isNotEmpty
                            ? CircleAvatar(
                                radius: 30,
                                backgroundColor: Tools.color17,
                                backgroundImage: NetworkImage(
                                  "$filePath/$image",
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(70),
                                child: Container(
                                  color: Tools.color17,
                                  width: 60,
                                  height: 60,
                                  child: Center(
                                    child: Text(
                                      initial,
                                      style: const TextStyle(
                                        color: Tools.color10,
                                        fontSize: Tools.fontSize02,
                                        fontWeight: Tools.fontWeight01,
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
                              firstname,
                              style: const TextStyle(
                                color: Tools.color07,
                                fontWeight: Tools.fontWeight01,
                              ),
                            ),
                            Text(
                              lastname,
                              style: const TextStyle(
                                color: Tools.color07,
                                fontWeight: Tools.fontWeight01,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () => {Navigator.pop(context)},
                      child: const Icon(
                        Icons.close_rounded,
                        color: Tools.color02,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserInfoView(uid: id),
                      ),
                    ),
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Tools.color09,
                        ),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.info,
                          color: Tools.color02,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Détails",
                          style: TextStyle(
                            color: Tools.color02,
                            fontWeight: Tools.fontWeight01,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserUpdateView(uid: id),
                      ),
                    ),
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Tools.color09,
                        ),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.edit,
                          color: Tools.color02,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Modifier",
                          style: TextStyle(
                            color: Tools.color02,
                            fontWeight: Tools.fontWeight01,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => {onDelete(id)},
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Tools.color09,
                        ),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.delete,
                          color: Tools.color02,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Supprimer",
                          style: TextStyle(
                            color: Tools.color02,
                            fontWeight: Tools.fontWeight01,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => {Navigator.pop(context)},
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Tools.color09,
                        ),
                        bottom: BorderSide(
                          color: Tools.color09,
                        ),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.cancel_rounded,
                          color: Tools.color02,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Annuler",
                          style: TextStyle(
                            color: Tools.color02,
                            fontWeight: Tools.fontWeight01,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
// ***************** Ending to show menu *****************

// ******************** Load user info ********************
  List<UserInfo> spouseInfoList = [];
  List<UserInfo> childrenInfoList = [];

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

    setState(() {
      // --------------------- Father info ---------------------
      fatherInfo['id'] = userData['id'] ?? 0;
      fatherInfo['initial'] = helper.getInitial(
        "${userData['firstname']}",
        "${userData['lastname']}",
      );
      fatherInfo['firstname'] = userData['firstname'] ?? '';
      fatherInfo['lastname'] = userData['lastname'] ?? '';
      fatherInfo['fullname'] =
          "${fatherInfo['firstname']} ${fatherInfo['lastname']}";
      fatherInfo['profile'] = userData['filename'] ?? '';

      // --------------------- Mother info ---------------------
      if (userData['spouse_info'] != null) {
        var spouseInfoData = userData['spouse_info']['spouse_id'] ?? [];
        var spouseNameData = userData['spouse_info']['spouse_name'] ?? [];

        if (spouseInfoData is Map) {
          // Add the spouse info to the list
          spouseInfoList.add(
            UserInfo(
              onTap: () {
                showMenu(
                  id: spouseInfoData['id'] as int,
                  initial: helper.getInitial(
                    "${spouseInfoData['firstname']}",
                    "${spouseInfoData['lastname']}",
                  ),
                  image: spouseInfoData['filename'] ?? "",
                  firstname: "${spouseInfoData['firstname']}",
                  lastname: "${spouseInfoData['lastname']}",
                );
              },
              name: helper.processString(
                input: "${spouseInfoData['firstname']}",
                length: 8,
              ),
              image: spouseInfoData['filename'] ?? "",
              initial: helper.getInitial(
                "${spouseInfoData['firstname']}",
                "${spouseInfoData['lastname']}",
              ),
            ),
          );
        } else {
          for (var item in spouseInfoData) {
            spouseInfoList.add(
              UserInfo(
                onTap: () {
                  showMenu(
                    id: item['id'] as int,
                    initial: helper.getInitial(
                      "${item['firstname']}",
                      "${item['lastname']}",
                    ),
                    image: item['filename'] ?? "",
                    firstname: "${item['firstname']}",
                    lastname: "${item['lastname']}",
                  );
                },
                name: helper.processString(
                  input: "${item['firstname']}",
                  length: 8,
                ),
                image: item['filename'] ?? "",
                initial: helper.getInitial(
                  "${item['firstname']}",
                  "${item['lastname']}",
                ),
              ),
            );
          }
        }

        for (int i = 0; i < spouseNameData.length; i++) {
          // Add the spouse name to the list
          spouseInfoList.add(
            UserInfo(
              onTap: () {},
              name: helper.processString(
                input: "${spouseNameData[i]}",
                length: 8,
              ),
              image: "",
              initial: helper.getInitial(
                "${spouseNameData[i]}",
                "",
              ),
            ),
          );
        }
      }

      // -------------------- Children info --------------------
      if (userData['children_info'] != null) {
        var childrenInfoData = userData['children_info']['children_id'] ?? [];
        var childrenNameData = userData['children_info']['children_name'] ?? [];

        if (childrenInfoData is Map) {
          // Add the spouse info to the list
          childrenInfoList.add(
            UserInfo(
              onTap: () {
                showMenu(
                  id: childrenInfoData['id'] as int,
                  initial: helper.getInitial(
                    "${childrenInfoData['firstname']}",
                    "${childrenInfoData['lastname']}",
                  ),
                  image: childrenInfoData['filename'] ?? "",
                  firstname: "${childrenInfoData['firstname']}",
                  lastname: "${childrenInfoData['lastname']}",
                );
              },
              name: helper.processString(
                input: "${childrenInfoData['firstname']}",
                length: 8,
              ),
              image: childrenInfoData['filename'] ?? "",
              initial: helper.getInitial(
                "${childrenInfoData['firstname']}",
                "${childrenInfoData['lastname']}",
              ),
            ),
          );
        } else {
          for (var item in childrenInfoData) {
            childrenInfoList.add(
              UserInfo(
                onTap: () {
                  showMenu(
                    id: item['id'] as int,
                    initial: helper.getInitial(
                      "${item['firstname']}",
                      "${item['lastname']}",
                    ),
                    image: item['filename'] ?? "",
                    firstname: "${item['firstname']}",
                    lastname: "${item['lastname']}",
                  );
                },
                name: helper.processString(
                  input: "${item['firstname']}",
                  length: 8,
                ),
                image: item['filename'] ?? "",
                initial: helper.getInitial(
                  "${item['firstname']}",
                  "${item['lastname']}",
                ),
              ),
            );
          }
        }

        for (int i = 0; i < childrenNameData.length; i++) {
          // Add the spouse name to the list
          childrenInfoList.add(
            UserInfo(
              onTap: () {},
              name: helper.processString(
                input: "${childrenNameData[i]}",
                length: 8,
              ),
              image: "",
              initial: helper.getInitial(
                "${childrenNameData[i]}",
                "",
              ),
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
// *************** Ending to load user info ***************

  onDelete(int id) {
    myDialog.showMyDialog(
      title: "Avertissement",
      description: "Êtes-vous sûr de vouloir supprimer cette personne?",
      confirmAction: confirmDeletion,
      confirmTitle: "Oui",
      cancelTitle: "Non",
      context: context,
    );
  }

  confirmDeletion() {
    Navigator.of(context).pop();
    myDialog.showMyDialog(
      title: "Félicitation",
      description: "La personne a bien été supprimer de la liste.",
      confirmAction: () => {Navigator.of(context).pop()},
      confirmTitle: "Ok",
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    filePath = helper.getFilePath("profile");

    List<UserInfo> parentInfo = [
      UserInfo(
        onTap: () => {
          showMenu(
            id: fatherInfo['id'] as int,
            initial: "${fatherInfo['initial']}",
            image: "${fatherInfo['profile']}",
            firstname: "${fatherInfo['firstname']}",
            lastname: "${fatherInfo['lastname']}",
          )
        },
        name: helper.processString(
          input: "${fatherInfo['firstname']} ${fatherInfo['lastname']}",
          length: 8,
        ),
        image: "${fatherInfo['profile']}",
        initial: "${fatherInfo['initial']}",
      ),
    ];
    parentInfo.addAll(spouseInfoList);

    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(58.0),
              child: MyAppBar(
                title:
                    'Famille ${fatherInfo['firstname']} ${fatherInfo['lastname']}',
              ),
            ),
            drawer: const MyDrawer(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        // ***************** Parents list *****************
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: parentInfo,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        // ***************** Children list *****************
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: childrenInfoList,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (isLoading) const MyLoader(),
        ],
      ),
    );
  }
}

class UserInfo extends StatefulWidget {
  final String name;
  final String image;
  final String initial;
  final void Function() onTap;

  const UserInfo({
    super.key,
    required this.name,
    required this.image,
    required this.initial,
    required this.onTap,
  });

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  Helper helper = Helper();
  String filePath = "";

  @override
  Widget build(BuildContext context) {
    filePath = helper.getFilePath("profile");

    return Padding(
      padding: const EdgeInsets.only(
        left: 12.5,
        right: 12.5,
      ),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          width: 100,
          height: 125,
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Tools.color05,
            boxShadow: [
              Tools.shadow01,
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.image != ""
                  ? CircleAvatar(
                      radius: 43,
                      backgroundColor: Tools.color17,
                      backgroundImage: NetworkImage(
                        "$filePath/${widget.image}",
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(70),
                      child: Container(
                        color: Tools.color17,
                        width: 90,
                        height: 90,
                        child: Center(
                          child: Text(
                            widget.initial,
                            style: const TextStyle(
                              color: Tools.color05,
                              fontSize: Tools.fontSize03,
                              fontWeight: Tools.fontWeight01,
                            ),
                          ),
                        ),
                      ),
                    ),
              Text(
                widget.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Tools.color07,
                  fontWeight: Tools.fontWeight01,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
