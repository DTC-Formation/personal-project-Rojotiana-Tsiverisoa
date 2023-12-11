import 'package:flutter/material.dart';

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
      ),
    );
  }
}
