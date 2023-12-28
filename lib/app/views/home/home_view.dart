import 'package:flutter/material.dart';

import 'package:tetiharana/app/controller/user_controller.dart';
// import 'package:tetiharana/app/services/api_services.dart';
// import 'package:tetiharana/app/services/auth_services.dart';
import 'package:tetiharana/widget/navigation/app_bar.dart';
import 'package:tetiharana/widget/image/carousel.dart';
import 'package:tetiharana/widget/navigation/drawer.dart';
import 'package:tetiharana/utilities/tools.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  UserController userController = UserController();

  // AuthServices authServices = AuthServices();
  // List userInfo = [];
  // String rojo = "";
  // Future<String> loadData() async {
  //   var data = await authServices.getCurrentUser();
  //   setState(() {
  //     userInfo = data;
  //     userInfo
  //         .map((item) => {
  //               (print(item['firstname'])),
  //               rojo = "${item['firstname']} ${item['lastname']}",
  //               (print(rojo)),
  //             })
  //         .toList();
  //     print(userInfo);
  //   });
  //   return "success";
  // }

  onSuccess() {}

  onError() {
    print("Désolé, une erreur est survenue!");
  }

  @override
  void initState() {
    // loadData();
    userController.getCurrentUser(onSuccess, onError);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(58.0),
          child: MyAppBar(
            title: 'Bienvenue Rojotiana',
          ),
        ),
        drawer: const MyDrawer(),
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
                  onTap: () {
                    Navigator.of(context).pushNamed('/tree-app');
                  },
                  child: Container(
                    width: size.width,
                    height: 85,
                    decoration: BoxDecoration(
                      gradient: Tools.gradient05,
                      borderRadius: BorderRadius.circular(
                        Tools.radius01,
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
                            color: Tools.color05,
                            fontSize: Tools.fontSize02,
                            fontWeight: Tools.fontWeight01,
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
                        onTap: () {
                          Navigator.of(context).pushNamed('/familly');
                        },
                        child: Container(
                          height: 105,
                          decoration: BoxDecoration(
                            gradient: Tools.gradient04,
                            borderRadius: BorderRadius.circular(
                              Tools.radius01,
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
                                  color: Tools.color05,
                                  fontSize: Tools.fontSize02,
                                  fontWeight: Tools.fontWeight01,
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
                        onTap: () {
                          Navigator.of(context).pushNamed('/user/add');
                        },
                        child: Container(
                          height: 105,
                          decoration: BoxDecoration(
                            gradient: Tools.gradient03,
                            borderRadius: BorderRadius.circular(
                              Tools.radius01,
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
                                  color: Tools.color05,
                                  fontSize: Tools.fontSize02,
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
                  height: 10,
                ),
                Row(
                  children: [
                    Flexible(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/gallery');
                        },
                        child: Container(
                          height: 105,
                          decoration: BoxDecoration(
                            gradient: Tools.gradient02,
                            borderRadius: BorderRadius.circular(
                              Tools.radius01,
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
                                  color: Tools.color05,
                                  fontSize: Tools.fontSize02,
                                  fontWeight: Tools.fontWeight01,
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
                        onTap: () {
                          Navigator.of(context).pushNamed('/user/profile');
                        },
                        child: Container(
                          height: 105,
                          decoration: BoxDecoration(
                            gradient: Tools.gradient01,
                            borderRadius: BorderRadius.circular(
                              Tools.radius01,
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
                                  color: Tools.color05,
                                  fontSize: Tools.fontSize02,
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
    );
  }
}
