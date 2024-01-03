import 'package:flutter/material.dart';

import 'package:tetiharana/app/controller/auth_controller.dart';
import 'package:tetiharana/app/controller/user_controller.dart';
import 'package:tetiharana/app/views/auth/login_view.dart';
import 'package:tetiharana/utilities/helper.dart';
import 'package:tetiharana/utilities/tools.dart';
import 'package:tetiharana/widget/dialog/dialog.dart';
import 'package:tetiharana/widget/loader/loader.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Helper helper = Helper();
  MyDialog myDialog = MyDialog();
  bool isLoading = false;

// ***************** Get authenticated user info *****************
  UserController userController = UserController();
  String name = "";
  String initial = "";
  String? profile;
  String firstname = "";
  String lastname = "";
  String lastnamePart = "";
  String filePath = "";
  String filename = "";

  loadCurrentUser() async {
    await userController.getCurrentUser(onLoadSuccess, onLoadFail);
  }

  onLoadSuccess(userData) {
    firstname = userData['firstname'] ?? '';
    lastname = userData['lastname'] ?? '';
    lastnamePart = helper.getNamePart(lastname);
    filePath = helper.getFilePath("profile");
    filename = userData['filename'] ?? '';

    setState(() {
      name = helper.processString("$lastnamePart $firstname");
      initial = helper.getInitial(firstname, lastname);
      profile = "$filePath/$filename";
    });
  }

  onLoadFail(error) {
    // debugPrint("Une erreur est survenue! $error");
  }

  @override
  void initState() {
    super.initState();
    loadCurrentUser();
  }
// ***************** End getting authenticated user info *****************

// ***************** Logout method *****************
  AuthController authController = AuthController();

  logout() {
    setState(() {
      isLoading = true;
    });

    authController.logout(onLogoutSuccess, onLogoutError);
  }

  onLogoutSuccess() {
    setState(() {
      isLoading = false;
    });

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const LoginView(),
      ),
      (route) => false,
    );
  }

  onLogoutError(String title, String message) {
    setState(() {
      isLoading = false;
    });

    myDialog.showMyDialog(
      title: title,
      description: message,
      confirmAction: () => {Navigator.of(context).pop()},
      confirmTitle: "Ok",
      context: context,
    );
  }
// ***************** End Logout method *****************

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    List<DrawerItem> drawerItem = [
      DrawerItem(
        icon: Icons.home_rounded,
        title: 'Accueil',
        action: () => {
          Navigator.pop(context),
          Navigator.of(context).pushNamed('/home'),
        },
      ),
      DrawerItem(
        icon: Icons.account_tree_rounded,
        title: 'Arbre généalogique',
        action: () => {
          Navigator.pop(context),
          Navigator.of(context).pushNamed('/tree-app'),
        },
      ),
      DrawerItem(
        icon: Icons.family_restroom_rounded,
        title: 'Classement par Famille',
        action: () => {
          Navigator.pop(context),
          Navigator.of(context).pushNamed('/familly'),
        },
      ),
      DrawerItem(
        icon: Icons.person_add_alt_rounded,
        title: 'Adhésion / Membres',
        action: () => {
          Navigator.pop(context),
          Navigator.of(context).pushNamed('/user/add'),
        },
      ),
      DrawerItem(
        icon: Icons.image,
        title: 'Gallerie',
        action: () => {
          Navigator.pop(context),
          Navigator.of(context).pushNamed('/gallery'),
        },
      ),
      DrawerItem(
        icon: Icons.account_circle_rounded,
        title: 'Profil utilisateur',
        action: () => {
          Navigator.pop(context),
          Navigator.of(context).pushNamed('/user/profile'),
        },
      ),
    ];

    return Stack(
      children: [
        Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // --------------------- Drawer Header ---------------------
                SizedBox(
                  width: size.width,
                  height: 220,
                  child: DrawerHeader(
                    padding: EdgeInsets.zero,
                    decoration: const BoxDecoration(
                      gradient: Tools.gradient06,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/background/bg_2.webp',
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        filename != ""
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(70),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    boxShadow: [Tools.shadow02],
                                  ),
                                  child: CircleAvatar(
                                    radius: 70,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: NetworkImage("$profile"),
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
                        const SizedBox(height: 12),
                        Text(
                          name,
                          style: const TextStyle(
                            color: Tools.color05,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                // --------------------- Drawer Item ---------------------
                Column(children: drawerItem),
                Column(
                  children: [
                    const Divider(),
                    DrawerItem(
                      icon: Icons.info_outline_rounded,
                      title: 'A propos',
                      action: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed('/about');
                      },
                    ),
                    DrawerItem(
                      icon: Icons.logout_rounded,
                      title: 'Se déconnecter',
                      // action: () {
                      //   Navigator.of(context).pushAndRemoveUntil(
                      //     MaterialPageRoute(
                      //       builder: (context) => const LoginPage(),
                      //     ),
                      //     (route) => false,
                      //   );
                      // },
                      action: logout,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (isLoading) const MyLoader(),
      ],
    );
  }
}

class DrawerItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final void Function() action;

  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    required this.action,
  });

  @override
  State<DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.action,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 3,
              ),
              child: Icon(
                widget.icon,
                color: Tools.color06,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              widget.title,
              style: const TextStyle(
                color: Tools.color06,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
