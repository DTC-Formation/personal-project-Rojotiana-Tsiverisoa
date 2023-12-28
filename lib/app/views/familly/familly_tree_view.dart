import 'package:flutter/material.dart';

import 'package:tetiharana/app/views/user/user_info_view.dart';
import 'package:tetiharana/app/views/user/user_update_view.dart';
import 'package:tetiharana/utilities/tools.dart';
import 'package:tetiharana/widget/dialog/dialog.dart';
import 'package:tetiharana/widget/navigation/app_bar.dart';
import 'package:tetiharana/widget/navigation/drawer.dart';

class FamillyTreeView extends StatefulWidget {
  final List userInfo;

  const FamillyTreeView({
    super.key,
    required this.userInfo,
  });

  @override
  State<FamillyTreeView> createState() => _FamillyTreeViewState();
}

class _FamillyTreeViewState extends State<FamillyTreeView> {
  MyDialog myDialog = MyDialog();

  onDelete() {
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
    var size = MediaQuery.of(context).size;

    // int id = 0;
    String firstname = "";
    String lastname = "";
    String image = "";

    widget.userInfo
        .map((item) => {
              // id = item['id'],
              firstname = item['firstname'],
              lastname = item['lastname'],
              image = item['image'],
            })
        .toList();

    showMenu() {
      // show the bottom sheet & display menu
      return showModalBottomSheet<void>(
        backgroundColor: Tools.color05,
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: size.width,
              height: 260,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Tools.color06,
                              backgroundImage: AssetImage(
                                image,
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
                      ),
                      Flexible(
                        child: InkWell(
                          onTap: () => {Navigator.pop(context)},
                          child: const Icon(
                            Icons.close_rounded,
                            color: Tools.color02,
                          ),
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
                          builder: (context) => const UserInfoView(),
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
                          builder: (context) => const UserUpdateView(),
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
                    onTap: onDelete,
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

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(58.0),
          child: MyAppBar(
            title: 'Famille $lastname',
          ),
        ),
        drawer: const MyDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: showMenu,
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
                                CircleAvatar(
                                  radius: 43,
                                  backgroundColor: Tools.color06,
                                  backgroundImage: AssetImage(
                                    image,
                                  ),
                                ),
                                Text(
                                  firstname,
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
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Flexible(
                        child: InkWell(
                          onTap: () => {},
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
                                CircleAvatar(
                                  radius: 43,
                                  backgroundColor: Tools.color06,
                                  backgroundImage: AssetImage(
                                    image,
                                  ),
                                ),
                                Text(
                                  firstname,
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
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () => {},
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
                                CircleAvatar(
                                  radius: 43,
                                  backgroundColor: Tools.color06,
                                  backgroundImage: AssetImage(
                                    image,
                                  ),
                                ),
                                Text(
                                  firstname,
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
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Flexible(
                        child: InkWell(
                          onTap: () => {},
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
                                CircleAvatar(
                                  radius: 43,
                                  backgroundColor: Tools.color06,
                                  backgroundImage: AssetImage(
                                    image,
                                  ),
                                ),
                                Text(
                                  firstname,
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
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Flexible(
                        child: InkWell(
                          onTap: () => {},
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
                                CircleAvatar(
                                  radius: 43,
                                  backgroundColor: Tools.color06,
                                  backgroundImage: AssetImage(
                                    image,
                                  ),
                                ),
                                Text(
                                  firstname,
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
