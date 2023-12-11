import 'package:flutter/material.dart';

import 'package:tetiharana/components/carousel.dart';
import 'package:tetiharana/package/my_package.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(58.0),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: AppBar(
              iconTheme: const IconThemeData(
                color: MyPackage.color07,
              ),
              title: const Text(
                'Accueil',
                style: TextStyle(
                  color: MyPackage.color07,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: MyPackage.color07,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text(
                  'Accueil',
                  style: TextStyle(
                    color: MyPackage.color06,
                  ),
                ),
                onTap: () {},
                leading: const Icon(
                  Icons.home_rounded,
                  color: MyPackage.color06,
                ),
              ),
              ListTile(
                title: const Text(
                  'Arbre généalogique',
                  style: TextStyle(
                    color: MyPackage.color06,
                  ),
                ),
                onTap: () {},
                leading: const Icon(
                  Icons.account_tree_rounded,
                  color: MyPackage.color06,
                ),
              ),
              ListTile(
                title: const Text(
                  'Classement par Famille',
                  style: TextStyle(
                    color: MyPackage.color06,
                  ),
                ),
                onTap: () {},
                leading: const Icon(
                  Icons.family_restroom_rounded,
                  color: MyPackage.color06,
                ),
              ),
              ListTile(
                title: const Text(
                  'Adhésion / Membres',
                  style: TextStyle(
                    color: MyPackage.color06,
                  ),
                ),
                onTap: () {},
                leading: const Icon(
                  Icons.person_add_alt_rounded,
                  color: MyPackage.color06,
                ),
              ),
              ListTile(
                title: const Text(
                  'Gallerie',
                  style: TextStyle(
                    color: MyPackage.color06,
                  ),
                ),
                onTap: () {},
                leading: const Icon(
                  Icons.image,
                  color: MyPackage.color06,
                ),
              ),
              ListTile(
                title: const Text(
                  'Profil utilisateur',
                  style: TextStyle(
                    color: MyPackage.color06,
                  ),
                ),
                onTap: () {},
                leading: const Icon(
                  Icons.account_circle_rounded,
                  color: MyPackage.color06,
                ),
              ),
              const Divider(
                color: MyPackage.color09,
              ),
              ListTile(
                title: const Text(
                  'Se déconnecter',
                  style: TextStyle(
                    color: MyPackage.color06,
                  ),
                ),
                onTap: () {},
                leading: const Icon(
                  Icons.logout_rounded,
                  color: MyPackage.color06,
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyCarousel(),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: size.width,
                    height: 85,
                    decoration: BoxDecoration(
                      gradient: MyPackage.gradient05,
                      borderRadius: BorderRadius.circular(
                        MyPackage.radius01,
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                          ),
                          child: Opacity(
                            opacity: 0.7,
                            child: SizedBox(
                              width: 75,
                              height: 75,
                              child: Image.asset(
                                "assets/images/icon/icon_tree.png",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'Arbre généalogique',
                          style: TextStyle(
                            color: MyPackage.color05,
                            fontSize: MyPackage.fontSize02,
                            fontWeight: MyPackage.fontWeight01,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Flexible(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 105,
                          decoration: BoxDecoration(
                            gradient: MyPackage.gradient04,
                            borderRadius: BorderRadius.circular(
                              MyPackage.radius01,
                            ),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 15,
                                ),
                                child: Opacity(
                                  opacity: 0.7,
                                  child: SizedBox(
                                    width: 65,
                                    height: 65,
                                    child: Image.asset(
                                      "assets/images/icon/icon_familly.png",
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'Famille',
                                style: TextStyle(
                                  color: MyPackage.color05,
                                  fontSize: MyPackage.fontSize02,
                                  fontWeight: MyPackage.fontWeight01,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 105,
                          decoration: BoxDecoration(
                            gradient: MyPackage.gradient03,
                            borderRadius: BorderRadius.circular(
                              MyPackage.radius01,
                            ),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 15,
                                ),
                                child: Opacity(
                                  opacity: 0.7,
                                  child: SizedBox(
                                    width: 65,
                                    height: 65,
                                    child: Image.asset(
                                      "assets/images/icon/icon_user_add.png",
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'Adhésion',
                                style: TextStyle(
                                  color: MyPackage.color05,
                                  fontSize: MyPackage.fontSize02,
                                  fontWeight: MyPackage.fontWeight01,
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
                  height: 10,
                ),
                Row(
                  children: [
                    Flexible(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 105,
                          decoration: BoxDecoration(
                            gradient: MyPackage.gradient02,
                            borderRadius: BorderRadius.circular(
                              MyPackage.radius01,
                            ),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 15,
                                ),
                                child: Opacity(
                                  opacity: 0.7,
                                  child: SizedBox(
                                    width: 65,
                                    height: 65,
                                    child: Image.asset(
                                      "assets/images/icon/icon_gallery_1.png",
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'Gallerie',
                                style: TextStyle(
                                  color: MyPackage.color05,
                                  fontSize: MyPackage.fontSize02,
                                  fontWeight: MyPackage.fontWeight01,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 105,
                          decoration: BoxDecoration(
                            gradient: MyPackage.gradient01,
                            borderRadius: BorderRadius.circular(
                              MyPackage.radius01,
                            ),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 15,
                                ),
                                child: Opacity(
                                  opacity: 0.7,
                                  child: SizedBox(
                                    width: 65,
                                    height: 65,
                                    child: Image.asset(
                                      "assets/images/icon/icon_user.png",
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'Profil',
                                style: TextStyle(
                                  color: MyPackage.color05,
                                  fontSize: MyPackage.fontSize02,
                                  fontWeight: MyPackage.fontWeight01,
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
    );
  }
}
